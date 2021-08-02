Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A8563DD00D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Aug 2021 07:34:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229988AbhHBFe6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Aug 2021 01:34:58 -0400
Received: from mail-eopbgr1400104.outbound.protection.outlook.com ([40.107.140.104]:37216
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229792AbhHBFe6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Aug 2021 01:34:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pb+8l3aRS/YvYzw6WNcIHf/eybwvPZ4F7azjNRJcQHo8+DjKZocYOsRwrEYg8n/0A/bWddLFbW1CamTdd9WunMK8Qb7LnzqwNn23kEHFlyWVcloFfU+Hf4JhRbOybOL1dHxJjoRGdNAI3GHdx9kZq78qIRLNWKeMIVims//eco0NavnMgNbvcaxyJ4q+ldpzlsfyTIERLAD2/5fEDK7XTIiMASJmTN4Bie0794Nvvuo+fXISfs1IIXrDUed3Dw792159ETQ9WuWJa3FcWxKG4tLChiOzUg456RFK7Fwy4t7zn9MYlvWz3c76nAZSOR3owGvALngyUgjyyBviYq/ZWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZMOSzs1Utz9GDEcn4Ag5+SeUqNm4ebpaGby7HejTYEw=;
 b=JeE3odyIEJ0R+obI9eN1cFqglq3mbWbHcoH86qLaCKMKfEGZJfIMAxq26p1GtvDbhCHUGIaxwbOThQ/KxvlcdC+oUu9Z759Myf3fOwgghy3Vjlp2dp0JC317c5kA4dIjMxwoAmybrgvA5qifW6GD174SHSpnmhlN11+KnVlHEEM6FQ4zG6/9Nv4bqd6x3frBf927jEu+B9WH+/K+FQ4Ls42mp6DwQEOzs5YJaQqo9EJaFvR0X78aNKSe9rzqdrV0W2v65VmKp0hmbe2zBQ78wx7Mt4LkiGzelVG4oQKkjMU036beoxoyi9SfyUawFZtLJ5kKCDyq6QQiNVk30yPlxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZMOSzs1Utz9GDEcn4Ag5+SeUqNm4ebpaGby7HejTYEw=;
 b=o4LDCI80GS0DN7XDLGXHnrYkrZQ7UEFjUTJ8uU8Iee9KFkM4DZ9Rr6tv72dUVC04rD0tEejSVkRtWX8ifBFO9NHEuoZKYh0wI9L8R3aLkjOjJ2RmR9+b+PJbsE4eOXkWrGCMHGTRDangBqsK+/7ueMJQcah7gn9U1lDrrAorRy4=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB2959.jpnprd01.prod.outlook.com (2603:1096:404:80::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Mon, 2 Aug
 2021 05:34:46 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::7db6:310f:a5ed:82f6]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::7db6:310f:a5ed:82f6%3]) with mapi id 15.20.4373.026; Mon, 2 Aug 2021
 05:34:46 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa@kernel.org>, Ulrich Hecht <uli+renesas@fpond.eu>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>
Subject: RE: [PATCH] mmc: renesas_sdhi: increase suspend/resume latency limit
Thread-Topic: [PATCH] mmc: renesas_sdhi: increase suspend/resume latency limit
Thread-Index: AQHXSNlLLnK0MeXzxECYWiEeEguOWqtcHUuAgAQPPJA=
Date:   Mon, 2 Aug 2021 05:34:46 +0000
Message-ID: <TY2PR01MB3692486033934E1C007EBF6AD8EF9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20210514155318.16812-1-uli+renesas@fpond.eu>
 <YQQah2Q8qmQPEl7F@ninjato>
In-Reply-To: <YQQah2Q8qmQPEl7F@ninjato>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5a4321fa-6de3-4841-712f-08d955773d55
x-ms-traffictypediagnostic: TYAPR01MB2959:
x-microsoft-antispam-prvs: <TYAPR01MB2959F9EE080E62A2F475AFDED8EF9@TYAPR01MB2959.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: U1JyfzBE9QVkwZEaZn7Py6COWi3pBUw3P2MMtccXJvVDXjBxN8C/NknHVxdcshAG72T7fyAGE1XecABwaOWs13njKeJsxmuDcF8ZUNzgtpMf6FAVZ+cG2afQag0/KAYngbb8fLyAXovRnDz22g33Ks0U2LYm5djr2JCskDY3XfMZ+mFd3p7V7X5FWDq1gr4+vQoBQgP1+o8Z/O6+0n8dA57duJQ38Vd8U2hr93+u4rCZAlAUSyNDAxAkzxnoN1LkS6609+0HOeBPfXVquu9GIISUSrP6Kow7icCn4lRCLvUp2EWHznjEBdx45PCW88W3TgfU0E06KRc7zajS8I2vsfJ4e6U6XwueuNQ5MAbQ1UvUftJarY0GmaBnJc5jLdJMfbtCWD4A3A4qCFmdb3zvEbVvJXbjjAwWtcR9KeRGckouZlyTSNf5KnScv9k+EP7xK2FYeQE/+Oz5a7AT6jEus30Qz4JlQT/3OeUwL4Lj26IIfLusX2aGo++q8Dl3enBs3ZVG5ANWGxiQmZlcys2Qn+xc4AbFav7epFbDQ8acBVea5dc7uGQQF1cvijcwvMO9JMJPm2nWtw6Uk4YBuNACxNJAyqtALLh3k6JzYSarCRqBTFQtMxmszC95QXSItZbKO2fiVo4n+jyzecx1JZZqZoABY5IE6nbvsyhYVau6xoRPW+Ra889COkB+QpDRV5LoKFEbsjyLB00PVhcpfJsWQg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(366004)(396003)(346002)(376002)(26005)(38100700002)(186003)(2906002)(8676002)(110136005)(6506007)(54906003)(7696005)(8936002)(83380400001)(316002)(55236004)(86362001)(76116006)(52536014)(55016002)(122000001)(9686003)(66556008)(66476007)(38070700005)(66446008)(33656002)(4326008)(5660300002)(71200400001)(66946007)(64756008)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BQY7U1s8m5NQcve7i/Xx443isrhWy7UyffWeRx/ARKyddW1mF71XnOn5pS+T?=
 =?us-ascii?Q?zRfRj3RIATjn+rfLF2Xt0iyA772BD5mcf8Ydlhml4mzImW8YdIQH+VFLnpid?=
 =?us-ascii?Q?hcXIzvBTNA4SIF9ZulXInV9SAH13NBi2zVyVhDNEE0kvJyMaG/4zaRmTnH5W?=
 =?us-ascii?Q?ewHMRFHkjcfVE3fmCtdD3ZwjDOfxTWuHOnSQkt09iGYBeRplqiXFAYAcQiJm?=
 =?us-ascii?Q?bOVwE4HuB1Ut/SST+nXW6VjzMypGUJFELCaENw7WS1sz9Nu8bZbVB1EPAsMp?=
 =?us-ascii?Q?4yZecdsk5yUUzKXPE6SwKl8mpEjh4i/aKYL5k4881+Sx7JigiN6hhmeQVFgb?=
 =?us-ascii?Q?zjAx9Sww886ZC1vdjsiDbXlYLWtxmAAETnyReFmqPEXfW3wq/vRCmWBh3oOe?=
 =?us-ascii?Q?456AJqT0lU7y8AaXBSHt2onqaCtKVuqjF+nbDQW5uCdAYietws1+Vm74g7vA?=
 =?us-ascii?Q?OsauFl2Nc3bcwUOFCGmkUdPUt1EsXLqS7EDe2muDatAPvxo0cqCDnN7SVaD6?=
 =?us-ascii?Q?BkoEAODfG9JGXAEurNIonzSpm/QJ+cKVM+vwIwA9UROfcIhZSAtERXswUw07?=
 =?us-ascii?Q?Wp3Kuy5g7Ylq3QnDLd0BunanYmVzWziOgacmux8RW40OcCwcd84WJbFfOCXM?=
 =?us-ascii?Q?ZxNsQrOj07udyaWNAasRyoQtGV+TdICaYy9qhhklZRMVzsqG0LdrINlXx2eD?=
 =?us-ascii?Q?I310Jew+KRELi+qoPiJoyzmhulis5HbKxasOoEivEmGJheLuD47AYwH1FeBi?=
 =?us-ascii?Q?mSefqumXKwXEtclEW2v0sxi52/Oimk4F06jF8+koh6U61sbCN+UZxzfUQqJE?=
 =?us-ascii?Q?WwNxN/QNO1dDrRvm/hmnfwAlhzM2WKdAkWL5YLhV9CoF/F4OfkSI2qfpD017?=
 =?us-ascii?Q?p15bjZdO3GxV4RMYTo62j1hBpjs6rbQESJiRmNPwEB6VbxTyBwYxFOJgMz8O?=
 =?us-ascii?Q?AuNsEa/6YE6K1ybvDLGmqLEvbnmqANVKEjK4FZi8Kj+zCaSx+zPWBvRTBtkB?=
 =?us-ascii?Q?Ee5THxQlcARJi6ZiWvGlvRv7H6MR9aYWmy6yBJZAacC3ZEPxQeTKpFMNm3a6?=
 =?us-ascii?Q?GBP4Lgcd8tj4NtKqUnP17p1ZWksai/NtUcl2NECowuGhNOiAzkImfjw0o63F?=
 =?us-ascii?Q?sLkEPd7rh6xoTtSSo1wmti9bubPz4iV+TQT0az2fOM9XTXu+qNaaDBVffNi5?=
 =?us-ascii?Q?HXVqb5vZrwFcnw5Amp6rsUviytq37/X/niO8gVjqc9ilT7E0Trzfg/WwkSNi?=
 =?us-ascii?Q?bDrPEJlt6KHGqEKkj2cWMucUqBbw6+5ug61S6lhLILMdYILrSpHG8qHxAnG0?=
 =?us-ascii?Q?kukGEdk4XgjGVczMAkdOcTtK?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a4321fa-6de3-4841-712f-08d955773d55
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2021 05:34:46.6945
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mu3w10ztdVL4+RMrWDH+i9W2siFg2D3loQGbW/ZPhcczlkcSlO3DPZJustmuUCCDroIatY3kZWHzxE6f+5OV7Y+tFzZwZQTpj9WQaNQkDzDBygX5JGSssaF0pEbW4yCk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2959
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san, Ulrich-san,

> From: Wolfram Sang, Sent: Saturday, July 31, 2021 12:28 AM
>=20
> On Fri, May 14, 2021 at 05:53:18PM +0200, Ulrich Hecht wrote:
> > The TMIO core sets a very low latency limit (100 us), but when using R-=
Car
> > SDHI hosts with SD cards, I have observed typical latencies of around 2=
0-30
> > ms. This prevents runtime PM from working properly, and the devices rem=
ain
> > on continuously.
> >
> > This patch sets the default latency limit to 100 ms to avoid that.
> >
> > Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
>=20
> Adding Shimoda-san to CC.
>=20
> Shimoda-san: can you kindly run your SDHI tests with this patch applied?

Sure!

However, I have a question about this patch.
Would you know how to measure the latencies?
I enabled function trace of rpm and checked the log, but I could not observ=
e
any behavior changes with and without applying this patch.

---
echo 1 > /sys/kernel/debug/tracing/events/rpm/enable
dd if=3D/dev/mmcblk1 of=3D/dev/null bs=3D4k count=3D1
cat /sys/kernel/debug/tracing/trace

# /root/trace/read.sh
# tracer: nop
#
# entries-in-buffer/entries-written: 36/36   #P:8
#
#                                _-----=3D> irqs-off
#                               / _----=3D> need-resched
#                              | / _---=3D> hardirq/softirq
#                              || / _--=3D> preempt-depth
#                              ||| /     delay
#           TASK-PID     CPU#  ||||   TIMESTAMP  FUNCTION
#              | |         |   ||||      |         |
    kworker/4:1H-307     [004] d..1   125.845356: rpm_resume: mmc0:0001 fla=
gs-4 cnt-1  dep-0  auto-1 p-0 irq-0 child-0
    kworker/4:1H-307     [004] d..1   125.845401: rpm_resume: ee140000.mmc =
flags-4 cnt-1  dep-0  auto-1 p-0 irq-0 child-0
    kworker/4:1H-307     [004] d..1   125.867766: rpm_idle: ee140000.mmc fl=
ags-1 cnt-1  dep-0  auto-1 p-0 irq-0 child-0
    kworker/4:1H-307     [004] d..1   125.867774: rpm_return_int: rpm_idle+=
0x40/0x3d0:ee140000.mmc ret=3D-11
    kworker/4:1H-307     [004] d..1   125.867785: rpm_idle: soc flags-5 cnt=
-0  dep-1  auto-1 p-0 irq-0 child-27
    kworker/4:1H-307     [004] d..1   125.867788: rpm_return_int: rpm_idle+=
0x40/0x3d0:soc ret=3D-13
    kworker/4:1H-307     [004] d..1   125.867796: rpm_return_int: rpm_resum=
e+0x124/0x6d8:ee140000.mmc ret=3D0
    kworker/4:1H-307     [004] d..1   125.867819: rpm_suspend: ee140000.mmc=
 flags-d cnt-0  dep-0  auto-1 p-0 irq-0 child-0
    kworker/4:1H-307     [004] d..1   125.867948: rpm_return_int: rpm_suspe=
nd+0x150/0x620:ee140000.mmc ret=3D0
    kworker/4:1H-307     [004] d..1   125.867962: rpm_idle: mmc0:0001 flags=
-1 cnt-1  dep-0  auto-1 p-0 irq-0 child-0
    kworker/4:1H-307     [004] d..1   125.867965: rpm_return_int: rpm_idle+=
0x40/0x3d0:mmc0:0001 ret=3D-11
    kworker/4:1H-307     [004] d..1   125.867974: rpm_idle: mmc0 flags-5 cn=
t-0  dep-1  auto-1 p-0 irq-0 child-1
    kworker/4:1H-307     [004] d..1   125.867978: rpm_return_int: rpm_idle+=
0x40/0x3d0:mmc0 ret=3D-13
    kworker/4:1H-307     [004] d..1   125.867985: rpm_return_int: rpm_resum=
e+0x124/0x6d8:mmc0:0001 ret=3D0
    kworker/4:1H-307     [004] d..1   125.868009: rpm_resume: ee140000.mmc =
flags-4 cnt-1  dep-0  auto-1 p-0 irq-0 child-0
    kworker/4:1H-307     [004] d..1   125.868013: rpm_return_int: rpm_resum=
e+0x124/0x6d8:ee140000.mmc ret=3D1
    kworker/0:1H-295     [000] d..1   125.879823: rpm_suspend: ee140000.mmc=
 flags-d cnt-0  dep-0  auto-1 p-0 irq-0 child-0
    kworker/0:1H-295     [000] d..1   125.879833: rpm_return_int: rpm_suspe=
nd+0x150/0x620:ee140000.mmc ret=3D0
    kworker/0:1H-295     [000] d..1   125.879843: rpm_suspend: mmc0:0001 fl=
ags-d cnt-0  dep-0  auto-1 p-0 irq-0 child-0
    kworker/0:1H-295     [000] d..1   125.879856: rpm_return_int: rpm_suspe=
nd+0x150/0x620:mmc0:0001 ret=3D0
    kworker/4:1H-307     [004] d..1   125.880562: rpm_resume: mmc0:0001 fla=
gs-4 cnt-1  dep-0  auto-1 p-0 irq-0 child-0
    kworker/4:1H-307     [004] d..1   125.880569: rpm_return_int: rpm_resum=
e+0x124/0x6d8:mmc0:0001 ret=3D1
    kworker/4:1H-307     [004] d..1   125.880591: rpm_resume: ee140000.mmc =
flags-4 cnt-1  dep-0  auto-1 p-0 irq-0 child-0
    kworker/4:1H-307     [004] d..1   125.880594: rpm_return_int: rpm_resum=
e+0x124/0x6d8:ee140000.mmc ret=3D1
    kworker/0:1H-295     [000] d..1   125.883242: rpm_suspend: ee140000.mmc=
 flags-d cnt-0  dep-0  auto-1 p-0 irq-0 child-0
    kworker/0:1H-295     [000] d..1   125.883249: rpm_return_int: rpm_suspe=
nd+0x150/0x620:ee140000.mmc ret=3D0
    kworker/0:1H-295     [000] d..1   125.883258: rpm_suspend: mmc0:0001 fl=
ags-d cnt-0  dep-0  auto-1 p-0 irq-0 child-0
    kworker/0:1H-295     [000] d..1   125.883262: rpm_return_int: rpm_suspe=
nd+0x150/0x620:mmc0:0001 ret=3D0
          <idle>-0       [004] d.h2   125.928997: rpm_suspend: ee140000.mmc=
 flags-9 cnt-0  dep-0  auto-1 p-0 irq-0 child-0
          <idle>-0       [004] d.h2   125.929015: rpm_return_int: rpm_suspe=
nd+0x150/0x620:ee140000.mmc ret=3D0
          <idle>-0       [004] d.h2   125.945766: rpm_suspend: ee140000.mmc=
 flags-9 cnt-0  dep-0  auto-1 p-0 irq-0 child-0
          <idle>-0       [004] dNh2   125.945808: rpm_return_int: rpm_suspe=
nd+0x150/0x620:ee140000.mmc ret=3D0
     kworker/4:2-361     [004] d..1   125.945872: rpm_suspend: ee140000.mmc=
 flags-a cnt-0  dep-0  auto-1 p-0 irq-0 child-0
     kworker/4:2-361     [004] d..1   125.945956: rpm_idle: soc flags-1 cnt=
-0  dep-1  auto-1 p-0 irq-0 child-26
     kworker/4:2-361     [004] d..1   125.945960: rpm_return_int: rpm_idle+=
0x40/0x3d0:soc ret=3D-13
     kworker/4:2-361     [004] d..1   125.945966: rpm_return_int: rpm_suspe=
nd+0x150/0x620:ee140000.mmc ret=3D0
---

Best regards,
Yoshihiro Shimoda

> That would be very kind, thank you!
>=20
> > ---
> >  drivers/mmc/host/renesas_sdhi_core.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/re=
nesas_sdhi_core.c
> > index 635bf31a6735..4f41616cc6bb 100644
> > --- a/drivers/mmc/host/renesas_sdhi_core.c
> > +++ b/drivers/mmc/host/renesas_sdhi_core.c
> > @@ -32,6 +32,7 @@
> >  #include <linux/pinctrl/pinctrl-state.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/pm_domain.h>
> > +#include <linux/pm_qos.h>
> >  #include <linux/regulator/consumer.h>
> >  #include <linux/reset.h>
> >  #include <linux/sh_dma.h>
> > @@ -1147,6 +1148,9 @@ int renesas_sdhi_probe(struct platform_device *pd=
ev,
> >  		host->ops.hs400_complete =3D renesas_sdhi_hs400_complete;
> >  	}
> >
> > +	/* keep tmio_mmc_host_probe() from setting latency limit too low */
> > +	dev_pm_qos_expose_latency_limit(&pdev->dev, 100000);
> > +
> >  	ret =3D tmio_mmc_host_probe(host);
> >  	if (ret < 0)
> >  		goto edisclk;
> > --
> > 2.20.1
> >
