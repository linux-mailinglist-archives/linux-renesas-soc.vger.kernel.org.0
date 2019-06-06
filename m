Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D903736DC9
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2019 09:51:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726664AbfFFHvA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Jun 2019 03:51:00 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33311 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725769AbfFFHu7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jun 2019 03:50:59 -0400
Received: by mail-wr1-f68.google.com with SMTP id n9so1333296wru.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Jun 2019 00:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QBmmKv+7ZDKGF8hH6xhReHZg7CvJv0+fmZ3TMZlj7Vc=;
        b=lvUuCREFYF+qZKWaREaHRKWCm1quAOhMfPaVBZm/K0bgmuNXSLWZCqUfKTWn1dUBl3
         R4K4IlC88ewh44C+5GLh+9U4gm/zTi0pgXvvVhp01wvMDm6gPdXkN6r002iDnOC1QkHp
         fjfej/s+C1GCo628TSuZSSZKnXNTjvsIujKZPCDLoSuU1aLBsu+Q2Bdw0u+8L27puPTa
         aJyfDQSzOtqGg08Gkl661Q6yNo1qULVNSv4fpvaVhD0DLapYtJjs0B3ntYIfOf5rIuBM
         Keh7ucM3XPf+JSPI47cIs9jLUx60AwcWwe17no8Uicv1HtJK2cnuhyrJurqv79seZhKL
         37OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QBmmKv+7ZDKGF8hH6xhReHZg7CvJv0+fmZ3TMZlj7Vc=;
        b=MdoHfXWS8ExthBUiyBzRAoK4RdpPxwXZS3GHs4z+UJRRAN83yhy/7dVSBVmMKRbTRt
         f4PL7t/hSTOZAqAAu2UcOPJLjFCctpDTs7YBWgAevElr+d+rgLOfh2PlZDDM8ednMlkh
         U6Dp9SBvklpUfAY5vVFTXOUCmktgkaw8IINOSfcuqL3gKdQJt3aQQq+/0y2lbnJBn4CP
         FsYddbMaK6ceMn6NAVNAF71BOF1eQTzQLLeNPreTI/nM+WUHaX8YVDJC861SX79HZC7/
         7KAJa/bnUfVMkQxVp3mBE2txPBw6/1W2Hx1LcVUSfboggaIm2faGNyWwX89UjUvglXBh
         3xwQ==
X-Gm-Message-State: APjAAAUdgk+pa5jgJSkW3cbrZomx/IC/ox/uftXoz34G/a8WatAWtm8r
        8/H9R+vuliXBTKOEFIG5F0vHvKlF
X-Google-Smtp-Source: APXvYqwDIWt3rdcmT319/WbRbD02P669S45za4CBmERhWhXhePhM/GF4qoNx6Yq8w/3vGBKPcgrWkw==
X-Received: by 2002:adf:e311:: with SMTP id b17mr28523866wrj.11.1559807457651;
        Thu, 06 Jun 2019 00:50:57 -0700 (PDT)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id a62sm1057532wmf.19.2019.06.06.00.50.56
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jun 2019 00:50:56 -0700 (PDT)
Subject: Re: pcie-card issue with R-Car M3-W WS1.1 board (NETDEV WATCHDOG:
 eth0 (e1000e): transmit queue 0 timed out)
To:     Biju Das <biju.das@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
References: <OSBPR01MB2103EF2B0100BB5B1D734D63B8160@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <f4d818f4-9677-fbfa-0838-adce391ed417@gmail.com>
 <OSBPR01MB2103DE26A1526173CD49CD22B8170@OSBPR01MB2103.jpnprd01.prod.outlook.com>
From:   Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <bcc05571-ca6e-645d-703e-3755372132b5@gmail.com>
Date:   Thu, 6 Jun 2019 09:50:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <OSBPR01MB2103DE26A1526173CD49CD22B8170@OSBPR01MB2103.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 6/6/19 8:45 AM, Biju Das wrote:
> Hi Marek,
> 
>> Subject: Re: pcie-card issue with R-Car M3-W WS1.1 board (NETDEV
>> WATCHDOG: eth0 (e1000e): transmit queue 0 timed out)
>>
>> On 6/5/19 9:40 AM, Biju Das wrote:
>>> Hi All,
>>>
>>>
>>>
>>> Looks like there is a pcie issue on R-Car M3-W  WS1.1 Salvator-XS
>>> board with upstream kernel.
>>>
>>>
>>>
>>> As we know M3-W board has 2 memory banks
>>>
>>>
>>>
>>> Bank #0: 0x048000000 - 0x0bfffffff, 1.9 GiB
>>>
>>> Bank #1: 0x600000000 - 0x67fffffff, 2 GiB
>>>
>>>
>>>
>>> I am using PCIE-ethernet  card(Ethernet controller: Intel Corporation
>>> 82574L Gigabit Network Connection) for pcie testing.
>>>
>>>
>>>
>>> With default configuration, it detects the ethernet  card
>>>
>>>
>>>
>>> root@salvator-x:~# lspci
>>>
>>> 00:00.0 PCI bridge: Renesas Technology Corp. Device 0028
>>>
>>> 01:00.0 Ethernet controller: Intel Corporation 82574L Gigabit Network
>>> Connection
>>>
>>>
>>>
>>> However, if we enable kernel configuration for PCIE-ethernet
>>> card(CONFIG_E1000E=y)then i get below crash during boot
>>>
>>>
>>>
>>> [   11.999119] ------------[ cut here ]------------
>>>
>>> [   12.004979] NETDEV WATCHDOG: eth0 (e1000e): transmit queue 0 timed
>>> out
>>>
>>> [   12.012734] WARNING: CPU: 0 PID: 0 at net/sched/sch_generic.c:443
>>> dev_watchdog+0x3e8/0x420
>>>
>>> [   12.022206] CPU: 0 PID: 0 Comm: swapper/0 Not tainted
>>> 5.2.0-rc3-arm64-renesas-00004-g2e3a083-dirty #25
>>>
>>> [   12.032728] Hardware name: Renesas Salvator-X 2nd version board
>>> based on r8a7796 (DT)
>>>
>>> [   12.041772] pstate: 60000005 (nZCv daif -PAN -UAO)
>>>
>>> [   12.047756] pc : dev_watchdog+0x3e8/0x420
>>>
>>> [   12.052948] lr : dev_watchdog+0x3e8/0x420
>>>
>>> [   12.058111] sp : ffff000010003d00
>>>
>>> [   12.062557] x29: ffff000010003d00 x28: 0000000000000002
>>>
>>> [   12.069000] x27: 00000000ffffffff x26: ffff000010f1c000
>>>
>>> [   12.075426] x25: ffff800639324430 x24: ffff000010f4f740
>>>
>>> [   12.081829] x23: ffff8006393243e0 x22: ffff00001104c000
>>>
>>> [   12.088207] x21: ffff000010f4a000 x20: ffff800639324000
>>>
>>> [   12.094564] x19: 0000000000000000 x18: ffffffffffffffff
>>>
>>> [   12.100903] x17: 00000000000040f8 x16: 000000000000403c
>>>
>>> [   12.107222] x15: 0000000000000001 x14: ffff000010baef68
>>>
>>> [   12.113520] x13: 0000000000000000 x12: 0000000000000000
>>>
>>> [   12.119809] x11: 0000000000000002 x10: 0000000000000002
>>>
>>> [   12.126077] x9 : 0000000000000000 x8 : ffff000010f4f708
>>>
>>> [   12.132331] x7 : ffff00001015d06c x6 : ffff000010f52000
>>>
>>> [   12.138574] x5 : 0000000000000000 x4 : 0000000000000002
>>>
>>> [   12.144798] x3 : ffffffffffffff50 x2 : ffff000010f6f7d8
>>>
>>> [   12.151022] x1 : 6610066f85848800 x0 : 0000000000000000
>>>
>>> [   12.157235] Call trace:
>>>
>>> [   12.160547]  dev_watchdog+0x3e8/0x420
>>>
>>> [   12.165081]  call_timer_fn+0xbc/0x400
>>>
>>> [   12.169596]  expire_timers+0x110/0x230
>>>
>>> [   12.174194]  run_timer_softirq+0xe4/0x1a0
>>>
>>> [   12.179047]  __do_softirq+0x114/0x578
>>>
>>> [   12.183542]  irq_exit+0x144/0x150
>>>
>>> [   12.187665]  __handle_domain_irq+0x60/0xb8
>>>
>>> [   12.192558]  gic_handle_irq+0x58/0xa8
>>>
>>> [   12.197014]  el1_irq+0xbc/0x180
>>>
>>> [   12.200913]  arch_cpu_idle+0x34/0x238
>>>
>>> [   12.205308]  default_idle_call+0x1c/0x40
>>>
>>> [   12.209961]  do_idle+0x1fc/0x2f0
>>>
>>> [   12.213895]  cpu_startup_entry+0x24/0x28
>>>
>>> [   12.218540]  rest_init+0x1a0/0x270
>>>
>>> [   12.222671]  arch_call_rest_init+0xc/0x14
>>>
>>> [   12.227417]  start_kernel+0x4a8/0x4d4
>>>
>>> [   12.231818] irq event stamp: 40197
>>>
>>> [   12.235962] hardirqs last  enabled at (40196): [<ffff00001015d12c>]
>>> console_unlock+0x3ec/0x5c0
>>>
>>> [   12.245376] hardirqs last disabled at (40197): [<ffff0000100817a4>]
>>> do_debug_exception+0xbc/0x178
>>>
>>> [   12.255042] softirqs last  enabled at (40174): [<ffff0000100f13a8>]
>>> _local_bh_enable+0x20/0x40
>>>
>>> [   12.264434] softirqs last disabled at (40175): [<ffff0000100f17e4>]
>>> irq_exit+0x144/0x150
>>>
>>> [   12.273278] ---[ end trace cfa1ae1709343a35 ]---
>>>
>>> [   12.278880] e1000e 0000:01:00.0 eth0: Reset adapter unexpectedly
>>>
>>>
>>>
>>> Q1) Has any one observed  this issue?
>>>
>>>
>>>
>>> It works without any issues for the following cases with upstream kernel.
>>>
>>>
>>>
>>> Case1: Use the below commit[1] from renesas-bsp
>>>
>>>
>>>
>>> [1].
>>> https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-bsp.git/
>>> commit/?id=561e15db1ed8c5cc2fc340796e2d1c643111d27a
>>>
>>>
>>>
>>> Case 2: Disable the bank#1 from device tree
>>>
>>>
>>>
>>> +++ b/arch/arm64/boot/dts/renesas/r8a7796-salvator-xs.dts
>>>
>>> +#if 0
>>>
>>>         memory@600000000 {
>>>
>>>                 device_type = "memory";
>>>
>>>                 reg = <0x6 0x00000000 0x0 0x80000000>;
>>>
>>>         };
>>>
>>> +#endif
>>>
>>> +
>>>
>>> };
>>>
>>>
>>>
>>> Q2) Could please share your thought on this issue?
>>
>> I presume it's this [1]. Robin seems to be working on a fix, see [2], although I
>> suspect he won't deliver it, so I'll have to get back to this topic myself.
> 
> Thanks for the update. Please let me know when the  patch is ready.  I am happy to test and will provide feedback.

Will do. I am kinda waiting for Robin, but maybe I just shouldn't :)

-- 
Best regards,
Marek Vasut
