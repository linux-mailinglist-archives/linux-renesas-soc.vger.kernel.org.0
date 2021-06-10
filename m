Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FA953A2197
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Jun 2021 02:45:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229845AbhFJArv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Jun 2021 20:47:51 -0400
Received: from mail-eopbgr1400131.outbound.protection.outlook.com ([40.107.140.131]:17508
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229639AbhFJArv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Jun 2021 20:47:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=adq5szxrsE1r0YoL5rRsFqo7I37pW1ZQ6L4p22kKNnuteJ510nWDZXLfyCwv0WS16N2YdYl9tNCpg2dVny3zl1EZrZ77cUvqYR/cplRrQWB6gDhsObr1X9bqFDPmbJbQSSGQngFMLVJoSq09aGMQ4GtfjVLSd9l82bImHFdE9rfwi97IOM9bUOAPRiiXmhh0E4FcgH5TSYg9ifJgk+0/eG7LA92OAz5xX3tvV5oHNUgHTbI1DGlht0GlvX4MWuG95NSKSP1ex6goX8s849hgbM90y+szkfAW6RiecXfU5lMLnpDd9R4HuMzDVTiq2bPOnwpgm05kzL2l8omS0gfHCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z28H7cFGepEYock9PY4m1xU9qg5iUKq7oa7iiroYAoo=;
 b=AHowERF9q7Nh9I1neD96gAwK34LSDcQUPKJmoKELb5Z31XE3BTpmGRvlJrVi2L4G87T+kABq3IXKXgphcgAxRrduPaLIAgwX6cc2H0jN0N2hSERaoqZurxTP1QoXaiIfRvG60thMEqavTTAyp8e6fqAsiHNVp9cL+PTOrXf0XRAnP+IdtQlSx4sA80adLinsfODTxV8ANHsWHMN2HB2N2bCtDXQUv8jFQLDjS809kWWe1qGy7oI1tAq/O7I+iNeYtx+LW5++f5REca6DHcZz+L6U0IO+fXBwj38csN63FjlfmSagRrdRwzKKemmv5c4ecz8axqbD5NT38X/0I926Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z28H7cFGepEYock9PY4m1xU9qg5iUKq7oa7iiroYAoo=;
 b=AdYEP9G5hiLqsPi2ZamaPSuW1Lc9rychmQe2aBx8vRpegnOOkFK5vWN/3qFzwROkXjVO9t9EZ39kuaYYOAPAyOq719dOzLpVIXm8k0EasaVypVECo8L0Hm9L16zQSJtPSooIRA23HHagqvxxiZZ4Gb7hZIgQY+1rB4RYup+k734=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYXPR01MB1727.jpnprd01.prod.outlook.com (2603:1096:403:b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.29; Thu, 10 Jun
 2021 00:45:42 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::4c5d:66ee:883a:72a5]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::4c5d:66ee:883a:72a5%6]) with mapi id 15.20.4219.022; Thu, 10 Jun 2021
 00:45:42 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "jirislaby@kernel.org" <jirislaby@kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3] serial: sh-sci: Stop dmaengine transfer in
 sci_stop_tx()
Thread-Topic: [PATCH v3] serial: sh-sci: Stop dmaengine transfer in
 sci_stop_tx()
Thread-Index: AQHXXNGkj5DIm2K88kqd+niZLV/ShasLnsqAgADLOYA=
Date:   Thu, 10 Jun 2021 00:45:41 +0000
Message-ID: <TY2PR01MB36929CC5796DB5F02B306E63D8359@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20210609014902.271237-1-yoshihiro.shimoda.uh@renesas.com>
 <YMC2C0AXxhAxH/Mf@kroah.com>
In-Reply-To: <YMC2C0AXxhAxH/Mf@kroah.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:788d:25a8:6b90:faf3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bf63a678-a118-4e0b-bd5c-08d92ba913ae
x-ms-traffictypediagnostic: TYXPR01MB1727:
x-microsoft-antispam-prvs: <TYXPR01MB17277947C360F2712B52F2E6D8359@TYXPR01MB1727.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1060;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VtNZcdTO/7h8z+DGiDJFikz1lq1h/3CpAnM7AddCECZR670qN+CAinirHcxOkxCpZcoQVtdKqRa8BiSoaIRC38oF/kBKSoBPqQd4+0dys0m9TxvFApoJK60eXgiC7wU9U7u/5w2VeFU8kHsIZYnCvcVBOViN3KRAQj4WP67UdVUrMNREO46ZJgndRQFzK0XjyFdlZxpaBOT62Gs433hd8pg9sre+sWfLfWIF1nb352ZnhKsL03LrMHVdKrbY3gmOG7bOeidIZSkknOSSCybGHFaa3bC+FZJPbPTh7xrbgTCW4lQiSg1U58j7p2s33/jJlx4/OGv8/yED9jXm1c4d470ywU589dmvRpjiCMerPfJ9aTh/RUp2N7frXR51nZ4FOwAYaKLZgBdJXde9G+raysgbCJ5bphuphVTBqN/FdcBh4I5uVnHrFFCXOLkAOVeqJpKB8bBoIXgvxZFT+s0zmtT7xbEi4P7zCYWPuXWHPrl075O1xf0sjYA03zv1Vd7TZoqSnfMGZhPIXS5YFr+VG/LPpIFGcipm/BVZIpIKbwviuF2ajb3bl+6JrpreRRzZECVodVouh/BosKz+dmg1ZQy7RplUjdT9+CQ4odh0q/E=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39850400004)(376002)(136003)(366004)(316002)(9686003)(8676002)(83380400001)(8936002)(55016002)(54906003)(71200400001)(33656002)(2906002)(4326008)(6506007)(122000001)(38100700002)(6916009)(186003)(5660300002)(76116006)(66946007)(52536014)(66556008)(66476007)(7696005)(86362001)(64756008)(478600001)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?MIz/lnvDmvWyHB7P4p7KPTGeqdtzrwItHlttNeKEX/P/SosFqF4EF5RkY6kr?=
 =?us-ascii?Q?gvYWguoI+daZINWVWfaM6wS+9n9C48quC69snQnmHjI6Cg6KcK9vtnSs2tCl?=
 =?us-ascii?Q?z14cO3UDW8u2XiUhFd6ZCdFVT9b2iKsUgXFkE98ol9tDsJNTNdgr6ulUhY3y?=
 =?us-ascii?Q?lICX0+7QelWl3KLXSOwq8ANCB8jL/iwo7TqPDT/nuP9JY9Hkd1m1jmD1n1XC?=
 =?us-ascii?Q?xUrYQrPUjDVjQ17am7yc+LuAAvnXtbcopTxP1xBTg7ZTGDzLdN/Y5qUV7xXe?=
 =?us-ascii?Q?4IzM1sjI4XSXFNupFD7JeksP/UtNCSKDhDZO7k7VJTKB9T1gIVzx1bhPJ++z?=
 =?us-ascii?Q?2RqFe1qEi8gf1KdItFkQ6v9f+TenN7JX0hd8qOimDiJBoThdMWDnvvuUx9Le?=
 =?us-ascii?Q?RC4MF9LHSchb8Ua3Em/tC7msA+Q/19msu8ckw7FAxmZvlWAfZc3nMwD/dJF3?=
 =?us-ascii?Q?hI78O5gJgXKxGWswk3WBjGlSgzMYmwlIPIpKmy6f+RC6fWi4sYH+eocx9dVd?=
 =?us-ascii?Q?Wr9mqpgyM3XYWpI6E3V+0zk6UX+vtnoWp7EXeZPSSr9gUYTKuo9rvFK30QIG?=
 =?us-ascii?Q?PdG2sWVCtkK2OoJtB3tAp71USQd+K0CyvOSR0uE7EtqxezYzBbzxcTcCYqta?=
 =?us-ascii?Q?9wXzwi67Giz+omNO/3kwotVBMYb2cG/HzUXeB8tNwfhk4mB6/wwIx2qFXUxN?=
 =?us-ascii?Q?A4S4MZ8kv50yRPEeEn3cK3956gqoDzukZCwN7de0yebjTa+nQGJyfDD70rGi?=
 =?us-ascii?Q?omI4T16UFn+xhHFdq4xQ8yPbCKoHAtm75EtJsOzHVXW0UmgJiMn86L+J/Mz6?=
 =?us-ascii?Q?ZTmKBk7TfFQMjXeBNh1BhCEJX1XLM9eQ6FHhrt5Swu7COtBLluijYGl/VGUi?=
 =?us-ascii?Q?Meq/+8AaVOdeyisf8vcQCrVjSpiN10JgfDXtL1q6cJdOfBn7G4+Piq+j+4+t?=
 =?us-ascii?Q?UU31EWyM4gE0fHhqrXb2TxCwJM1aAvMF4guirgV6eyfNN3f1dOB72BTjhCSl?=
 =?us-ascii?Q?U83JbxzamKKDGiXpBCaVwmRcJKEpZbpHof8TODi2DNmvxAWjRad7VAXI+XvE?=
 =?us-ascii?Q?udOlrYDJxu0KIIQA+tIXC7KuiiUVVgpTtpbXPComDF4UifMRZNUHTRyIU+Q2?=
 =?us-ascii?Q?qDjqhPtW6On+TG7i5iRnPUPPtR6j5CBp/1X/vBx2MTPnJO9LgWN5YC7R2hJz?=
 =?us-ascii?Q?yvebIm5ysVjr4wUnkSYjc0AENUESSgd2fLTpCUeLj/gkdDbg7zQllCpt9m5L?=
 =?us-ascii?Q?e9fQ+rBLbPHUAqOeCNipjjBxj2Qtk73NYM6FxQPsVx9OJ19uH+KU/EFi6ShQ?=
 =?us-ascii?Q?oyypFZ8Of8zlIJY+0Q9ww2Nl2dzs1dqg9FOnk1MwcuwHwxCZwv/peOMz0L2o?=
 =?us-ascii?Q?w5Dw2hE=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf63a678-a118-4e0b-bd5c-08d92ba913ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2021 00:45:42.4464
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w89/O1wlEs4BdVsx2PJX75fOSUZtL41Hb7V+vQd5S11lOdCUfsdWaXuHpO7oypf8ZUnbCniRzj58rMP7cqlFGhMKpXpSWcRrwR3ClBR8ryz5scIez5RivTunz8czYVma
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1727
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Greg,

> From: Greg KH, Sent: Wednesday, June 9, 2021 9:38 PM
>=20
> On Wed, Jun 09, 2021 at 10:49:02AM +0900, Yoshihiro Shimoda wrote:
> > Stop dmaengine transfer in sci_stop_tx(). Otherwise, the following
> > message is possible output when system enters suspend and while
> > transferring data, because clearing TIE bit in SCSCR is not able to
> > stop any dmaengine transfer.
> >
> >     sh-sci e6550000.serial: ttySC1: Unable to drain transmitter
> >
> > Note that this patch uses dmaengine_terminate_async() so that
> > we can apply this patch into longterm kernel v4.9.x or later.
> >
> > Fixes: 73a19e4c0301 ("serial: sh-sci: Add DMA support.")
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> >
> >  drivers/tty/serial/sh-sci.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> > index 4baf1316ea72..2d5487bf6855 100644
> > --- a/drivers/tty/serial/sh-sci.c
> > +++ b/drivers/tty/serial/sh-sci.c
> > @@ -610,6 +610,14 @@ static void sci_stop_tx(struct uart_port *port)
> >  	ctrl &=3D ~SCSCR_TIE;
> >
> >  	serial_port_out(port, SCSCR, ctrl);
> > +
> > +#ifdef CONFIG_SERIAL_SH_SCI_DMA
>=20
> Please no #ifdef in .c files.

I got it. I'll fix this somehow...

Best regards,
Yoshihiro Shimoda

