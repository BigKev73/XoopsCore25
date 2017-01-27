<h4 class='center'><{$smarty.const._PM_PRIVATEMESSAGE}></h4>
<{if $op}>
    <br>
    <div style="float:right; width: 49%; text-align: right;">
        <{if $op == "out"}>
            <a href='viewpmsg.php?op=in'><{$smarty.const._PM_INBOX}></a>
            |
            <a href='viewpmsg.php?op=save'><{$smarty.const._PM_SAVEBOX}></a>
        <{elseif $op == "save"}>
            <a href='viewpmsg.php?op=in'><{$smarty.const._PM_INBOX}></a>
            |
            <a href='viewpmsg.php?op=out'><{$smarty.const._PM_OUTBOX}></a>
        <{elseif $op == "in"}>
            <a href='viewpmsg.php?op=out'><{$smarty.const._PM_OUTBOX}></a>
            |
            <a href='viewpmsg.php?op=save'><{$smarty.const._PM_SAVEBOX}></a>
        <{/if}>
    </div>
    <div style="float:left; width: 49%;">
        <{if $op == "out"}><{$smarty.const._PM_OUTBOX}>
        <{elseif $op == "save"}><{$smarty.const._PM_SAVEBOX}>
        <{else}><{$smarty.const._PM_INBOX}><{/if}>
    </div>
    <br>
    <br>
    <{if $msg}>
        <div class="confirmMsg"><{$msg}></div>
    <{/if}>
    <{if $errormsg}>
        <div class="errorMsg"><{$errormsg}></div>
    <{/if}>

    <{if $pagenav}>
        <div style="padding: 5px; float: right; text-align:right;">
            <{$pagenav}>
        </div>
        <br style="clear: both;"/>
    <{/if}>
    <form name="<{$pmform.name}>" id="<{$pmform.name}>" action="<{$pmform.action}>" method="<{$pmform.method}>" <{$pmform.extra}> >
        <table border='0' cellspacing='1' cellpadding='4' width='100%' class='outer'>

            <tr align='center' valign='middle'>
                <th><input name='allbox' id='allbox' onclick='xoopsCheckAll("<{$pmform.name}>", "allbox");' type='checkbox' value='Check All'/></th>
                <th><img src='<{$xoops_url}>/images/download.gif' alt='' border='0'/></th>
                <th>&nbsp;</th>
                <{if $op == "out"}>
                    <th><{$smarty.const._PM_TO}></th>
                <{else}>
                    <th><{$smarty.const._PM_FROM}></th>
                <{/if}>
                <th><{$smarty.const._PM_SUBJECT}></th>
                <th align='center'><{$smarty.const._PM_DATE}></th>
            </tr>

            <{if $total_messages == 0}>
                <tr>
                    <td class='even' colspan='6' align='center'><{$smarty.const._PM_YOUDONTHAVE}></td>
                </tr>
            <{/if}>
            <{foreach item=message from=$messages}>
                <tr align='left' class='<{cycle values="odd, even"}>'>
                    <td valign='top' width='2%' align='center'>
                        <input type='checkbox' id='msg_id_<{$message.msg_id}>' name='msg_id[]' value='<{$message.msg_id}>'/>
                    </td>
                    <{if $message.read_msg == 1}>
                        <td valign='top' width='5%' align='center'><img src='assets/images/email_read.png' alt='<{$smarty.const._PM_READ}>'
                                                                        title='<{$smarty.const._PM_READ}>'/></td>
                    <{else}>
                        <td valign='top' width='5%' align='center'><img src='assets/images/email_notread.png' alt='<{$smarty.const._PM_NOTREAD}>'
                                                                        title='<{$smarty.const._PM_NOTREAD}>'/></td>
                    <{/if}>
                    <td valign='top' width='5%' align='center'>
                        <{if $message.msg_image != ""}>
                            <img src='<{$xoops_url}>/images/subject/<{$message.msg_image}>' alt=''/>
                        <{/if}>
                    </td>
                    <td valign='middle' width='10%'>
                        <{if $message.postername != ""}>
                            <a href='<{$xoops_url}>/userinfo.php?uid=<{$message.posteruid}>'><{$message.postername}></a>
                        <{else}>
                            <{$anonymous}>
                        <{/if}>
                    </td>
                    <td valign='middle'>
                        <a href='readpmsg.php?msg_id=<{$message.msg_id}>&amp;start=<{$message.msg_no}>&amp;total_messages=<{$total_messages}>&amp;op=<{$op}>'>
                            <{$message.subject}>
                        </a>
                    </td>
                    <td valign='middle' align='center' width='20%'>
                        <{$message.msg_time}>
                    </td>
                </tr>
            <{/foreach}>
            <tr class='bg2 center'>
                <td colspan='6'>
                    <{$pmform.elements.send.body}>
                    <{if $display}>
                        &nbsp;<{$pmform.elements.move_messages.body}>
                        &nbsp;<{$pmform.elements.delete_messages.body}>
                        &nbsp;<{$pmform.elements.empty_messages.body}>
                    <{/if}>
                    <{foreach item=element from=$pmform.elements}>
                        <{if $element.hidden == 1}>
                            <{$element.body}>
                        <{/if}>
                    <{/foreach}>
                </td>
            </tr>
        </table>
    </form>
    <{if $pagenav}>
        <div style="padding: 5px;float: right; text-align:right;">
            <{$pagenav}>
        </div>
    <{/if}>
<{/if}>
