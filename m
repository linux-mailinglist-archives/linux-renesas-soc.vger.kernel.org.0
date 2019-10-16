Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C5BBD8E10
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Oct 2019 12:37:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388318AbfJPKha (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Oct 2019 06:37:30 -0400
Received: from mail-eopbgr690056.outbound.protection.outlook.com ([40.107.69.56]:46341
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728559AbfJPKha (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Oct 2019 06:37:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YAc1A96IPumSJKmpcuVmr9N2Dhn04zqOm0+QYKHQtvCYbIxroFMVHB3/EvpOAH7QJGQtFJG5OUVtLMJQmyw6s3q8oubluxSYjK0rN33rmhy9tvgk5uPIqWetDD6YZ1sDtwyHAbfhlJWFSWAa4paegWeLL/uK27ocPR+UlxweHttInPwp1wbYTSj79dOVtrto95tK/2aUrOnX/HByHqRUdfLB4NoM2Eefmi6Ni9RjIHGhnF58BFs1l+bjAY8YS+QF90Os6GKyx3wBqHbSji+eztqLTIrP0sEM4g2EVlAJJBvnA7mkDsVmJ1TdyHDzvUMC/VmCtiz2pMHolC9i1NM1Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3NBGbhXUO3uEGHxt4zo36jFY/UB88enX3RnQoycN5jw=;
 b=JNOTTDdTZUpgxfz/+IgdmZaZYAkv023NBhdUC3BYMcfz8U7/V3Lx5JlzDGkGclKHkg2ZRD0tORL7DoNFsjnEm2XYQfw4DTbCCWPN037DecsGkeQ55G2mylzbWud2IL9timDOCh9AnP/w0NCEbAUNTxYTZ54Hv6RWDe20nt7cEb9LCSWJcaXbIXANM3R1Ks8UkHsxe7L3pPsCPiCh0kofhOpFKvA9MoZRsJIFFCC0vKKngkLHy2btQYtRxakj8JqiGr8fEhX9JZx7RQ1Fg0OUTvZtP5LM6KLmwlTNB9s126PwYwr0289VYLe49/+Aq/ryvbYsXUGOsrSFiBomsJt9VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3NBGbhXUO3uEGHxt4zo36jFY/UB88enX3RnQoycN5jw=;
 b=gWCSlLqdB1heAsMaDzQ4odFo3wpNWcnrb1oFtSe3G61QNoInwx5Xb6YERy56F3407ekKN4by5vtz/iM7NeaIaQMfXNe00k1Ga7Jh2XtVOYp95IJvPjTyvmeMpKe9u751wZvWn0QW8G+yQp03t87WxvdGWYiBkFMqnTHcPwuL00Q=
Received: from MWHPR02CA0010.namprd02.prod.outlook.com (2603:10b6:300:4b::20)
 by SN6SPR01MB13.namprd02.prod.outlook.com (2603:10b6:805:64::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.22; Wed, 16 Oct
 2019 10:37:23 +0000
Received: from CY1NAM02FT040.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::206) by MWHPR02CA0010.outlook.office365.com
 (2603:10b6:300:4b::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via Frontend
 Transport; Wed, 16 Oct 2019 10:37:23 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT040.mail.protection.outlook.com (10.152.75.135) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2347.16
 via Frontend Transport; Wed, 16 Oct 2019 10:37:23 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1iKggE-00064L-Sq; Wed, 16 Oct 2019 03:37:22 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1iKgg9-00047K-Pb; Wed, 16 Oct 2019 03:37:17 -0700
Received: from xsj-pvapsmtp01 (maildrop.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id x9GAbEDp017670;
        Wed, 16 Oct 2019 03:37:15 -0700
Received: from [172.30.17.123]
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michals@xilinx.com>)
        id 1iKgg6-00046g-Jz; Wed, 16 Oct 2019 03:37:14 -0700
Subject: Re: [PATCH] serial: core: Use cons->index for preferred console
 registration
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michal Simek <michal.simek@xilinx.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Michal Simek <monstr@monstr.eu>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jiri Slaby <jslaby@suse.com>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <4a877f1c7189a7c45b59a6ebfc3de607e8758949.1567434470.git.michal.simek@xilinx.com>
 <CAMuHMdWY2VsY-CyAxSvpm1XYicAWqU7NORSQofQ+T195DwyLUg@mail.gmail.com>
 <7284590f-2b74-1b47-2d61-783ad8d5f46f@monstr.eu>
 <CAMuHMdWZYALZB1bP5Mtoq4Nj5iubzdWBf1vRY9Mh5QvjCDhBgA@mail.gmail.com>
 <622f4c5e-e3ed-3f91-254d-78d905de79c9@xilinx.com>
 <20191015175422.GA1072965@kroah.com>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <1ef25e71-d617-77ca-31f8-09fb9b3ebbb8@xilinx.com>
Date:   Wed, 16 Oct 2019 12:37:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191015175422.GA1072965@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(136003)(396003)(376002)(346002)(39860400002)(199004)(189003)(6246003)(6666004)(356004)(53546011)(478600001)(4326008)(305945005)(65956001)(65806001)(36756003)(47776003)(76176011)(26005)(23676004)(229853002)(336012)(186003)(44832011)(2486003)(70206006)(70586007)(8936002)(446003)(31696002)(476003)(81156014)(31686004)(2616005)(126002)(8676002)(81166006)(486006)(110136005)(426003)(14444005)(316002)(58126008)(50466002)(5660300002)(36386004)(11346002)(2906002)(54906003)(230700001)(9786002)(106002);DIR:OUT;SFP:1101;SCL:1;SRVR:SN6SPR01MB13;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9215101-4f61-4e31-e3db-08d75224d4a2
X-MS-TrafficTypeDiagnostic: SN6SPR01MB13:
X-LD-Processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
X-Microsoft-Antispam-PRVS: <SN6SPR01MB13068CB18A4E1639D9433BC6920@SN6SPR01MB13.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0192E812EC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /OhHFggijbF5M/zZVTYHuKElHOs7ZqeTAfdhguUhPDNGTu21YEdxS+rgO8LOESFbPGIawnM0ATaGtDlRzAJRNwKMkloN3AQUaSjPZusWQ6+SgeCjbq1Jk7lUMXQbqi2glLgp0y/u5MiVs2/05HDXAJRboG+TmNJWndBOzQjrfHFe5nGeJSLQlhc7FBr7uqOGpO8bXszikwPwugsHxGs/peKU0LP9u0G0W7BICzMQiTyONYvS7hndk0A+CJNqEeh2gG1oC/rku6WURBeFjnqyonuPIAegylWwOXpcGLpR0t5faroqfqX2vcavzaKagZOfjpf/57R7i40d9vM89Jcn1HEZwR20l91mVVtpWMPQBnnXTDi1/P9MVTIK4NeKUQItnlkzk4ax4+W5Yc1Csp+ImhuEGvZ9bSzjI4XxGXdjEFY=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2019 10:37:23.4048
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9215101-4f61-4e31-e3db-08d75224d4a2
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6SPR01MB13
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 15. 10. 19 19:54, Greg Kroah-Hartman wrote:
> On Tue, Oct 15, 2019 at 04:36:56PM +0200, Michal Simek wrote:
>> On 15. 10. 19 11:51, Geert Uytterhoeven wrote:
>>> Hi Michal,
>>>
>>> On Tue, Oct 15, 2019 at 11:22 AM Michal Simek <monstr@monstr.eu> wrote:
>>>> On 15. 10. 19 11:19, Geert Uytterhoeven wrote:
>>>>> On Mon, Sep 2, 2019 at 4:29 PM Michal Simek <michal.simek@xilinx.com> wrote:
>>>>>> The reason for this patch is xilinx_uartps driver which create one dynamic
>>>>>> instance per IP with unique major and minor combinations. drv->nr is in
>>>>>> this case all the time setup to 1. That means that uport->line is all the
>>>>>> time setup to 0 and drv->tty_driver->name_base is doing shift in name to
>>>>>> for example ttyPS3.
>>>>>>
>>>>>> register_console() is looping over console_cmdline array and looking for
>>>>>> proper name/index combination which is in our case ttyPS/3.
>>>>>> That's why every instance of driver needs to be registered with proper
>>>>>> combination of name/number (ttyPS/3). Using uport->line is doing
>>>>>> registration with ttyPS/0 which is wrong that's why proper console index
>>>>>> should be used which is in cons->index field.
>>>>>>
>>>>>> Also it is visible that recording console should be done based on
>>>>>> information about console not about the port but in most cases numbers are
>>>>>> the same and xilinx_uartps is only one exception now.
>>>>>>
>>>>>> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
>>>>>
>>>>> This is now commit 91daae03188e0dd1 ("serial: core: Use cons->index
>>>>> for preferred console registration") in tty-next.
>>>>>
>>>>> This has been bisected to break the serial console on (at least)
>>>>> r8a7791/koelsch and r8a7795/h3-salvator-xs.
>>>>>
>>>>> The line "printk: console [ttySC0] enabled" is no longer printed.
>>>>> The system continues booting without any serial console output, and the
>>>>> login prompt never appears on the serial console.
>>>>>
>>>>> Reverting this commit fixes the issue.
>>>>
>>>> Sorry for trouble with this patch. Can you please point me to dts files
>>>> for these boards and also what's the value you have in uport->line and
>>>
>>> arch/arm/boot/dts/r8a7791-koelsch.dts
>>> arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
>>>
>>>> uport->cons->index?
>>>
>>> On r8a7791/koelsch:
>>>
>>>     Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
>>>     platform serial8250: uport->line = 0, uport->cons->index = -1
>>>     platform serial8250: uport->line = 1, uport->cons->index = -1
>>>     platform serial8250: uport->line = 2, uport->cons->index = -1
>>>     platform serial8250: uport->line = 3, uport->cons->index = -1
>>>     SuperH (H)SCI(F) driver initialized
>>>   * sh-sci e6e60000.serial: uport->line = 0, uport->cons->index = -1
>>>   * e6e60000.serial: ttySC0 at MMIO 0xe6e60000 (irq = 79, base_baud =
>>> 0) is a scif
>>>     printk: console [ttySC0] enabled
>>>     sh-sci e6e68000.serial: uport->line = 1, uport->cons->index = 0
>>>     e6e68000.serial: ttySC1 at MMIO 0xe6e68000 (irq = 80, base_baud =
>>> 0) is a scif
>>>
>>> On r8a7795/salvator-xs:
>>>
>>>     sh-sci e6550000.serial: uport->line = 1, uport->cons->index = -1
>>>     e6550000.serial: ttySC1 at MMIO 0xe6550000 (irq = 34, base_baud =
>>> 0) is a hscif
>>>   * sh-sci e6e88000.serial: uport->line = 0, uport->cons->index = -1
>>>   * e6e88000.serial: ttySC0 at MMIO 0xe6e88000 (irq = 120, base_baud =
>>> 0) is a scif
>>>     printk: console [ttySC0] enabled
>>>
>>> Actual serial consoles marked with *.
>>>
>>> There are no 8250 serial ports in the system, shmobile_defconfig just includes
>>> driver support for it.
>>
>> ok. I will take a look at why it is not initialized in this case. Do you
>> have any qemu available for these boards?
>>
>> Greg: Please revert this patch I will investigate why it is failing.
> 
> Which patch exactly?  Can you provide a revert?  That makes it easiest
> for me.

Sure. Revert sent.

Thanks,
Michal

