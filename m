Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B74D6359E6F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Apr 2021 14:16:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231402AbhDIMQ3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Apr 2021 08:16:29 -0400
Received: from mail-eopbgr1400132.outbound.protection.outlook.com ([40.107.140.132]:52605
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229801AbhDIMQ2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Apr 2021 08:16:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m1ad25Lv6JKEMGm8R/CqN2ttc0JfC3jS1u7BkgeOy833dgziEOK7ih5Ili0cbBa6OFkJEeAu09ypc8ugOTV9eYEFDCMzx0/8Z+BVhM0+3OkPQM5L7St/2xfuGEqQqJQq00VD+OMHgy4UHRKIHslebKiXwH/XEx+ky0Y7qVW/Vsu3mOR0LR3RFkVAgJnVmkKHJEgyFBAIzeVFUDNzbfsbnRrXDs6NfioCT5BtB60W8nAmf7Uc8Vw+eBmiAZM8Vt0IKto5M/8bfH8Nt4Zply2wZPIV0ge1RMSTsdDRsy78dITIrIfpQJNz4kvFgrntsRBVCxKqrjF5JNYAmauTjfQauw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HKNLiedp4pkjaORtvf0fCftHxdFB7FY5n48BOhUnBRg=;
 b=Onc6svTmQrTVsMzK5u/B2twYrONNEr+VIvUOmwjtsm3Y/RKxS/ZShfYawqLuvNE08v+56z4kWqMgXapexSk3C8L1eqV/Txh4NbqxG9uCFrV75no5/3iBlrXSWjd4U9oWenW9qX5wSjnC+W4PUz9b1vQeIB5PtTltjMD+STEDyuNkjUjnLsbJhI5iS9Vv7yizzmsQ/meJ0sWnPYqAATjGixISFyJaVDtTVQMkATrfxg9BgjDouSDIUNVtpSrP+QEhZ/dRoy3WLY6XXkS3Y1cL29YPDPltcisKTmbDo11xcNX1ZIQIcOYMdw2/KwUGdqWP3B5fxAth4V2bJ5eB8xZDMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HKNLiedp4pkjaORtvf0fCftHxdFB7FY5n48BOhUnBRg=;
 b=NUWk3PMyckzkQdU9ugW6IUjJVLoBiUZa8iXCazSA+V545LJY06MwwcxL9IemL+/H9HzVZsD98LN8q8j5z1egPgYwQ7as5gaubfcCOPKIwlJx3jImTiOmF7A8jcSS5BUXwS+H7ITEjbY0HCvX9Ovm85Zjk8eClV0b+uvmfgqOJds=
Received: from OSAPR01MB3683.jpnprd01.prod.outlook.com (2603:1096:604:33::12)
 by OS3PR01MB5941.jpnprd01.prod.outlook.com (2603:1096:604:b4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Fri, 9 Apr
 2021 12:16:13 +0000
Received: from OSAPR01MB3683.jpnprd01.prod.outlook.com
 ([fe80::7de7:7e65:a509:e3a0]) by OSAPR01MB3683.jpnprd01.prod.outlook.com
 ([fe80::7de7:7e65:a509:e3a0%4]) with mapi id 15.20.4020.017; Fri, 9 Apr 2021
 12:16:13 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Ulrich Hecht <uli+renesas@fpond.eu>
CC:     "wsa@kernel.org" <wsa@kernel.org>,
        "geert@linux-m68k.org" <geert@linux-m68k.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>
Subject: RE: [PATCH] serial: sh-sci: correct units in comment about DMA
 timeout
Thread-Topic: [PATCH] serial: sh-sci: correct units in comment about DMA
 timeout
Thread-Index: AQHXLRntrh8Gv0OgbkS+n0L/AKIa2KqsF3DQ
Date:   Fri, 9 Apr 2021 12:16:13 +0000
Message-ID: <OSAPR01MB3683F5855937833872F4FE23D8739@OSAPR01MB3683.jpnprd01.prod.outlook.com>
References: <20210409082524.3480-1-uli+renesas@fpond.eu>
In-Reply-To: <20210409082524.3480-1-uli+renesas@fpond.eu>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: fpond.eu; dkim=none (message not signed)
 header.d=none;fpond.eu; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e020e15b-810e-48dc-df5c-08d8fb514498
x-ms-traffictypediagnostic: OS3PR01MB5941:
x-microsoft-antispam-prvs: <OS3PR01MB5941CD6B02EB8F8BE679571DD8739@OS3PR01MB5941.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TrARUpbqnhZfxMC8VXBBfemiMu7+ZWAOlqtItDyKIZ/2iTsq+9670lpqcOsrXvJP4NfVrc00x11oUlZqWIJ26muJ49NRiPdkPah3y7q+1lpQ9yBsvyYbbmyUJ32cFgLYOxclW4Z6XAzZ1t5pwxvK+VQlN1x4sixKzwl+Q+79I7PYtbLcRX+Y1lpO4sdnj3ni7dZqa+2dNbNxyfs3/hdUgNXHDuX7IYQ3rwyshYBxZEZlRhER98OwbiV+ydqGohENzB9hSag6981zy9Y7u+iIFk11ISWAN4MghaKhKAcanMMuJ78E2uhAR+zIAhbZmJjB5Ieh39SCnb3DKLRHK/OaltReD4oQsqLRfQ8LpL/VJ6D6+6r72BhWKcd/GlgSSIrfzfogKimbbbrh5JDxFj0z9XM4VKz8vTHp+r2HLZoxnGBBAo7onbLVIDd+LHwBuf5bkYcF2eb4FK1skxBuxaPY/vH7oS0EfCXapgrUFSiWYgTqi96MGCtofZ09WANHjVGLiuLxN+ZJ+DCbXnwabbRaIujW3VVWtE51OpWEVJR5pQalgroXVtRmpV3Z2zRHQfzGHFT8IWVvZhvOFnfbKLNytUAllodCE5I351EZUn1BEf+DS4ArGwbnAVFsUjGqIOwlWDwxL/aAW3z3FqPDtDAmXBTqY94f8r4/rcOLDPtoOQw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB3683.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(396003)(376002)(39860400002)(366004)(52536014)(33656002)(66946007)(2906002)(478600001)(7696005)(66476007)(76116006)(66556008)(4326008)(66446008)(64756008)(6506007)(54906003)(5660300002)(55236004)(8676002)(86362001)(8936002)(316002)(26005)(71200400001)(38100700001)(55016002)(186003)(9686003)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?Z35suKG/DXKTwpbbCq0hYBULnvytVygXGy34yZJkN4tSkAg/8QnS/NyHNNwY?=
 =?us-ascii?Q?OfuwykpGebk/FvS/5FYn3YTi/Hfl+eRor9R+hz78zpWN+W8liyfijKDVbizA?=
 =?us-ascii?Q?qrbvaW1IpWZWhHL9GqBsyr2sl/06916aOF7pVRIOsKW3173/HaAu9GTOh/QL?=
 =?us-ascii?Q?7cm6XP2pV0irO8/jjnu3KhVeEvqav59Gx0DCrhc5SArkWcheRliUgoBptgTs?=
 =?us-ascii?Q?7vEbIiGzvZF38pIQoAfVkvtxyVT5HDJAvj4ACHcPSHLMtRDQnfmcVCvno2Td?=
 =?us-ascii?Q?Bc6UsQyvT+ha4Ql3QN3fbIgXL71ll1V/uzs+qLtcirfQaSpwhOlIHzYWunKu?=
 =?us-ascii?Q?b+cTJ1n6X5nkXOuRCtzOEBGxdiZog+e+4iNrcRgVY9j60AuGV8Qjls46y8bU?=
 =?us-ascii?Q?enYKsss40mIe+Q6gRpbaO+RHe5XSv/jMoZ0cocAESX8S8IVvAwHPAclIMTdM?=
 =?us-ascii?Q?jXpLWgNfoWqh/jO5r7jFb/casFzydNNcdAX2yUUITZ8pNsjrvBBGZmVLfLN5?=
 =?us-ascii?Q?6Ix2a5pen7OaXANjCQpg/5sd6a3TSTNDADtVcRrURnHh458QerKRBFVFl2nQ?=
 =?us-ascii?Q?MLFJxVVJa32RsW+9hEsXoV46iAmCpbibzQW1cnGsm3dP+su+WMt5eAU1Eg//?=
 =?us-ascii?Q?Vi6SrXgvcvREwbmb2j0NAjHwuBBJbxL101g1bthESm2Lt8GiHdX2mvtwiagO?=
 =?us-ascii?Q?Sykjcu6XT32Dg9xrUKtEHOHd6P/7gntoTLLgCz2UmeMIphKyv+H0mjTDYbty?=
 =?us-ascii?Q?LdaODoInXCUXeZhV82OSu7PmYw715ggkCMboTWakoJmgaowCkLSUrJpNEsZd?=
 =?us-ascii?Q?/CkD+jQjQ9HwvWuwHipLY1NRDoCU/IJQvXG2R1vZFz07rLm6utfdLOrStt6s?=
 =?us-ascii?Q?zmwtslF4i2WQ4CX27yhwUW8cbAnZi/DpHRmkwRk94cBMA1RjpMv4W8SUJeTV?=
 =?us-ascii?Q?0d8kB0cKc0PGnLF3PEfapRamvEouS1QxlCdEv4vLE1MTGV5//kXtV6YwkNtH?=
 =?us-ascii?Q?5Fz0X6grA1P+FIM7bEcmeYwx9OL9LilJkjzE641Cev0qIFhLUd5ds4i1yRV/?=
 =?us-ascii?Q?xtKqoU950x+jp4U2/Vd09dyYprLtifp0GbMCRx9jPGz01EE0eNeO2ouOn9NM?=
 =?us-ascii?Q?UsWzwxtx7LGpC6c6JOTJ8CULXqF57RhAVOS7pzoeB+AEKX0ZWDPypAdrIO4Q?=
 =?us-ascii?Q?CCu3OliGk1unzokbdwvKjtRAxSDSJCw49PLLEmeJFbFkzwNzZhCJpkJX6Ouz?=
 =?us-ascii?Q?hbVv5PcV6QkYU0RlCYbe4dK6yX5mC2s7soLneojoGb1J1rP9AeT++3QDJ1Lh?=
 =?us-ascii?Q?6vx9Ov/+y7vyOViwgBvFkivg?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB3683.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e020e15b-810e-48dc-df5c-08d8fb514498
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2021 12:16:13.3467
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W6rMoQd5RHeVM7paZGCFiq9cyBl9ezcG1aGFsFp7+zbCgTG4xBAEKC6NdEMXWKFgJnPqc+7jr1Do+QdCltTJUPWMUf7XKPgUUX0FPchhsy2fn4l8QrfVlAGXKUc4p48m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5941
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Ulrich-san,

Thank you for the patch!

> From: Ulrich Hecht, Sent: Friday, April 9, 2021 5:25 PM
>=20
> Since the transition to hrtimers, the calculation does not involve jiffie=
s
> any longer, which has led to confusion. State the times in ms instead.

IIUC, the unit of rx_timeout was changed from milliseconds to microseconds
when hrtimer is used. So, almost all comments was not needed.

Also, I'm wondering if the following condition is not needed or not.
This is because this was "20ms". But, perhaps, the driver will not
set rx_timeout to "20us" or small.

        if (s->rx_timeout < 20)
                s->rx_timeout =3D 20;

Best regards,
Yoshihiro Shimoda

> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
> ---
>  drivers/tty/serial/sh-sci.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index e3af97a59856..c4ce4cd120ba 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -2613,11 +2613,11 @@ static void sci_set_termios(struct uart_port *por=
t, struct ktermios *termios,
>  	 * Calculate delay for 2 DMA buffers (4 FIFO).
>  	 * See serial_core.c::uart_update_timeout().
>  	 * With 10 bits (CS8), 250Hz, 115200 baud and 64 bytes FIFO, the above
> -	 * function calculates 1 jiffie for the data plus 5 jiffies for the
> -	 * "slop(e)." Then below we calculate 5 jiffies (20ms) for 2 DMA
> -	 * buffers (4 FIFO sizes), but when performing a faster transfer, the
> -	 * value obtained by this formula is too small. Therefore, if the value
> -	 * is smaller than 20ms, use 20ms as the timeout value for DMA.
> +	 * function calculates 4ms for the data plus 20ms for the "slop(e)."
> +	 * Then below we calculate 20ms for 2 DMA buffers (4 FIFO sizes),
> +	 * but when performing a faster transfer, the value obtained by this
> +	 * formula is too small. Therefore, if the value is smaller than
> +	 * 20ms, use 20ms as the timeout value for DMA.
>  	 */
>  	s->rx_frame =3D (10000 * bits) / (baud / 100);
>  #ifdef CONFIG_SERIAL_SH_SCI_DMA
> --
> 2.20.1

