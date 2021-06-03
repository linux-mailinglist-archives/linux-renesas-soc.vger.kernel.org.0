Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89D373997A6
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jun 2021 03:47:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229817AbhFCBtP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Jun 2021 21:49:15 -0400
Received: from mail-eopbgr1400094.outbound.protection.outlook.com ([40.107.140.94]:26016
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229758AbhFCBtP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Jun 2021 21:49:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tt/PXTopRRYIDJb+NMj2+DZ7NDFU8rE817TM980cceTQNNKOj2fJ2GhF3FHyrtoC2k3UBaxbIx6VmFlb/dE8pjqs4VoMARm0Gb1MAk+FW6EIVGJgybntxfvxoYrb8o+6Uy8iphmNa1paxXKpGMMrAXk4BuXdG9vTJMfirBNRaRHQFmRy+n8a790a601cll1yFtNxjheRR0PiqaMS0pz4hZCVoXAOazcGnfSLMol4BvrmT1HTDmoe1C4VwSblCXf2BnmSzPWrcwrhuX5dN0am61++aHtHbPUFJXYkmCZU0rnzru+C4WAocu+NKBzM9ax0XuNtFeNHAcogsBANC3vEtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c8O0NxIqLn9pMJghuO6dHA+xgcpS0fJzDSnuwYIoikg=;
 b=G4TpyF3bEkxws6/nEhEyljjyoAPTangVuiM83gO2i2mcxhCUs6ft+htULRuIERpJGHWMZVUoohzUA/9l7UKT9j3tA6zMw2YQshYeL3bjTRbGsr+gNQkM+t+v4XCuXOflYSAx2THeCpB03mtGch19E5d03S/vmfBP0qyA8sojXEnxkuUlgrMcv2XhOslpNEgu/F2R0UKtIuJ/NK3u+N13teTsnGs+XyMWYA2o2gamFI+Nt85+AC4dp3Hdf0S4toazpcZkwReeyRNpvYCXfVathdY9wcqQfGnBWx6NEmAAMr7MuZ/+UthugIdgCHyX4q0taRPDeejmQ6kfM1rCrJc4Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c8O0NxIqLn9pMJghuO6dHA+xgcpS0fJzDSnuwYIoikg=;
 b=k53ERFp55VMfcPyrO9W4w1BS62uAe+bTnSRlR7DzsFPklyFEYRR92ugZSVAzyUmR8nHE3vBN6z2RtjuVWAwHw9i746hORmApOzG80E36vUBIzTTDDfEaXUur9PcvY+jTluDjOaWqkyicp4J0FkHMKWy15txvvF/UqrHUVvdYDXU=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYCPR01MB6685.jpnprd01.prod.outlook.com (2603:1096:400:af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22; Thu, 3 Jun
 2021 01:47:29 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::e413:c5f8:a40a:a349]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::e413:c5f8:a40a:a349%4]) with mapi id 15.20.4173.030; Thu, 3 Jun 2021
 01:47:29 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "jirislaby@kernel.org" <jirislaby@kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] serial: sh-sci: Stop dmaengine transfer in sci_stop_tx()
Thread-Topic: [PATCH] serial: sh-sci: Stop dmaengine transfer in sci_stop_tx()
Thread-Index: AQHXV6Q0IxbMhdAOJkuds3yrcx5w8asAnYmAgADljgA=
Date:   Thu, 3 Jun 2021 01:47:29 +0000
Message-ID: <TY2PR01MB3692C545672195370487FA60D83C9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20210602114108.510527-1-yoshihiro.shimoda.uh@renesas.com>
 <YLdyE/Jf/YcSz7AE@kroah.com>
In-Reply-To: <YLdyE/Jf/YcSz7AE@kroah.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 232d97ed-4b67-4ba0-4250-08d926318bdf
x-ms-traffictypediagnostic: TYCPR01MB6685:
x-microsoft-antispam-prvs: <TYCPR01MB6685AD51FF308CA0100F8D6FD83C9@TYCPR01MB6685.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1443;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KlpfMQdXrPJHfEqAt5ZiJ7wIE1iLKCXFLDyeYENOsjN/CjJLUVYeHw2zkZdiky837wNoHKkJfZwtwJv3hbFmet8oPGScqvXKZ8I3nLh7pHdU0IcViy616wa587s8T3zCuwRUaos+K56UEerFPA2upGA9bfuJvK1VTJKlvGPd4WIX2QC4l2pHm4KBpdXa9OPXu64Ov7teJba6eMmBymcdbcCgOYB5YhB+DbHiUFcbC7+MfluQikp1A76ROw76uOcSNT6EKqiDQKZ7c6HKNBV6ZhwphhTuebbMgJavO7Kt+eNHj9q4xZ1DGETXmsTQt0eNAU5oNFZ/ehAO8ovdxYpdNGKCO8zInBZgNSIq4nUmBjt8E8rlSrzWhcACOt4uFbn9sdKsbjptwJbgv2QbtGpMEeuZE7Ix8QdkLec+2XDWfg5AA3eKauGJ2vg16oMmjmYDfsn1eYym19Oajt3apsClRW9+8rN7n6EueJbVflzoFk2w7PnmlFWjwdCc1P3b6Vp4UeFPUvCvdWGCiOoVmXm6vRldjqwc8EzlbqaITur3RbOaMT70YZPAx127y0Xe5XmHCwB3JyHL6lUba0SJOmuAsqnkrnZFHBHhgDOZ+KEJX4U=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(186003)(6916009)(7696005)(26005)(55236004)(6506007)(4326008)(86362001)(316002)(33656002)(8676002)(54906003)(83380400001)(478600001)(52536014)(9686003)(55016002)(8936002)(5660300002)(122000001)(38100700002)(71200400001)(66556008)(66446008)(76116006)(2906002)(66946007)(66476007)(64756008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?8R8XjQoF4OlZeXJojuGNOuo+Et26xmpmMO88xFSy9gtEh0C+EHWFbyFLSvbJ?=
 =?us-ascii?Q?3+YnMEOPrJ0sWtobpcMyuwnYk1Fg7MGXMQ/ZTmH1n/1aBwOrHEmJT7kqM9Cq?=
 =?us-ascii?Q?aJMjjP9KfWzAJkzoa4Lc6CrZvn/aUNKmx2kbt5MlnkGhvt7qgozNkLFLidq6?=
 =?us-ascii?Q?kIB2LP34ZkB7RCL5xxcL14Rk6F1FYVhGzsK20qqhJ/1m9NMOLcAjEgDi1TqQ?=
 =?us-ascii?Q?YKsCId+8IhRa2h7kc0LZcrRDjnpayvW/uLkWmc4mpfqakOVATZhIN4bqS+ry?=
 =?us-ascii?Q?DxF1WtN9itWsf4oe8d/oawNE5cnZma+nloh4oVcrwLvRZ556Q4vYA0l5Hmcc?=
 =?us-ascii?Q?K8qdOBhwSkIUtW2SNVz3AH6eZlcEJ954SEJDRXd9S/Hj6PqtKnaOLzOJx50n?=
 =?us-ascii?Q?kb1WIj4m9Yulpdwlietk0Pn6CXPjFCi3EbkGquh/6Krw7BChKHkHUBBc1G4o?=
 =?us-ascii?Q?UisU3LCQW6p2ZPjrDoFUWbv5xND3JqhbLNAUYEHWKE0s8AH4n26TYdJ/DYme?=
 =?us-ascii?Q?t7jaXliw/PvB3W51aK97F+gdBJS4N/5m9CGsVkd22dz7SgFQWc2qrlwgI0j4?=
 =?us-ascii?Q?rlevfzY386cAVGDoMFOueER19TCVqPxdLVh94r3eK0AX+raBbvuSN9WMHWjN?=
 =?us-ascii?Q?KO3BtWHU+YsHwz3VYatlarM7KL7YxjBqvfrwI8V6lDnTqKNsXlvfIxQxni0C?=
 =?us-ascii?Q?n+tF6jXV7CRT+KfTiCyiIiPpMth07x5eG6+Btll+us1ZZQxDkCubfUNsLDwM?=
 =?us-ascii?Q?e+Bvw4TLLPFMkcZyX2JNsdLHCi7JE+S1PdGgvn+NnltTb7m8wJgKIV0R3ppz?=
 =?us-ascii?Q?YoFVQTVol3/tgeklBZukuSxCTMmPEX+gbjUHeZF0acdd2HOBB43iOXwmCfbJ?=
 =?us-ascii?Q?oMmb0Ysg//R5QqGI4VCVlpIe3W8sbFyymXDqcsH5TC6H8NAX3z6xV/+7LDgo?=
 =?us-ascii?Q?sU5gFYHA1dEbd87geVHvGQ/fuxeJidSt6H0dG5j1sn4k2eYwzJRSfSDiz+lS?=
 =?us-ascii?Q?y/eAPaRduOJlgqDqxLM5UADgVzB7wfWPVJJufiRooPMyi0RTmpYTyVdKUIMS?=
 =?us-ascii?Q?wLHOk9E9x96bt12rGM05HZ88Xb4UaT9QTMYQw0N9ssoJu8aqhj719X3czuIm?=
 =?us-ascii?Q?LpTFq6xvVQ/fJkx7ikYhTQoJ5/CgeGwEOIbGobeTLsQO/Q8Sppji37gsm9LZ?=
 =?us-ascii?Q?WZ2Otn69cN8nWnEN8gZlxSA4R5HEExxZxPMDzghPxYLe7P+5Ljtga/fXzfK8?=
 =?us-ascii?Q?0k/8mG3+0GY/NowOA7g92E0NvmOvviOyz82a6KFybwd6tMgFu4cpkmBq5u03?=
 =?us-ascii?Q?TbwWTHhq5ZJJb6HJdGXCsyZ0?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 232d97ed-4b67-4ba0-4250-08d926318bdf
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2021 01:47:29.0673
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ap3L244S2l50gVyBQbw8VT4ieOkiVcBQKReaZTly9VJrn3FpVyoy9UFa/HGP6HRS5F1ZnzXlO5ZrblogEYZn0OOIfY/7i/C7WRjnDxPV4ew+i3QM2IiYxzPm1k3VPpRH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6685
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Greg,

> From: Greg KH, Sent: Wednesday, June 2, 2021 8:57 PM
>=20
> On Wed, Jun 02, 2021 at 08:41:08PM +0900, Yoshihiro Shimoda wrote:
> > Stop dmaengine transfer in sci_stop_tx(). Otherwise, the following
> > message is possible output when system enters suspend and while
> > transferring data, because clearing TIE bit in SCSCR is not able to
> > stop any dmaengine transfer.
> >
> >     sh-sci e6550000.serial: ttySC1: Unable to drain transmitter
> >
> > Notes that this patch uses dmaengine_terminate_async() so that
> > we can apply this patch into longterm kernel v4.9.x or later.
> >
> > Fixes: 73a19e4c0301 ("serial: sh-sci: Add DMA support.")
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> >  drivers/tty/serial/sh-sci.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> > index 4baf1316ea72..e7130be48946 100644
> > --- a/drivers/tty/serial/sh-sci.c
> > +++ b/drivers/tty/serial/sh-sci.c
> > @@ -600,6 +600,9 @@ static void sci_start_tx(struct uart_port *port)
> >  static void sci_stop_tx(struct uart_port *port)
> >  {
> >  	unsigned short ctrl;
> > +#ifdef CONFIG_SERIAL_SH_SCI_DMA
> > +	struct sci_port *s =3D to_sci_port(port);
> > +#endif
>=20
> Please do not put #ifdef in .c files, this should be possible without
> that.

This #ifdef could avoid a compile warning if CONFIG_SERIAL_SH_SCI_DMA was n=
ot defined:

drivers/tty/serial/sh-sci.c: In function 'sci_stop_tx':
drivers/tty/serial/sh-sci.c:603:19: warning: unused variable 's' [-Wunused-=
variable]
  struct sci_port *s =3D to_sci_port(port);

Anyway, I'll avoid to use #ifdef in .c file. Thank you for your review!

Best regards,
Yoshihiro Shimoda

> thanks,
>=20
> greg k-h
