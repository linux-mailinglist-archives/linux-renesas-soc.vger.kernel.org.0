Return-Path: <linux-renesas-soc+bounces-10724-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0E99DA7FB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Nov 2024 13:39:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C3814B210B8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Nov 2024 12:34:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED45C1FC118;
	Wed, 27 Nov 2024 12:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="KBkLVgjj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010038.outbound.protection.outlook.com [52.101.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8111FC0F1;
	Wed, 27 Nov 2024 12:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732710889; cv=fail; b=N1z4ZDWMN4JAFEPtmKp8PHYWSHtYvq/OvSfrP125iPl5H2TmkEjBYsSfqN8qDIoWWD7b4/znp5Rj8kNbKhXvV2mKxsZS/7Yqid+t/q0JPaNlnz4cHufYVw2o+NbM3uXDZs7V1Tia/bNS4tYhkUkC8XidKzdPS8F90XtHJS/vq0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732710889; c=relaxed/simple;
	bh=QsK868JE7FT6tKEgL+buKYtMn/fmXmKCR3WWQsYw8o0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Sa6oH7xkdBynLj//o1tQHGhctPp1ZbHhXunJ9Tx+a5cLelg+Buq9hUZmmTNwIyhTsE8HcVlwt9Q8tj7bjr/i9JUOeISyaxC/zTxVQ4XHHqcgn/5auRy0vDJ/fF3c7q+/D2Kx+e7vxT2EQrGfcs6b0t5tN4+t4G8unJ5lN1q86aI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=KBkLVgjj; arc=fail smtp.client-ip=52.101.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LcOBNImOtzAi35mJ9rSwYaO+Py1GbSdGG2UF3J7t2oag6U0/6JH57+l2sZ+Ijs/3+oc9Gzi6FMRWLzLtRtz5QuNYj+Wln8hGYujgpcB590wYAMBmHb6Elqo3MySAR2AYUClB+Pd3NEEg4FP6HlMfOuCWLhM9dCMz7vMFv2JTC07VaYzaei8BQp/5weuzasbaNP9KYaXHKi7+Gmh1q4mbTiWhX9BgKOlAAxAo377vRv4gL8MhuJYyuKhUpXYT3KkFMQ/Twkzn5uwgX9uajsVA+Y5XOiQfDNmA4oVroPW3rSaStyMNXDFhTY9/sPmjDqyOi3g3pW5iTVtK17UGKNfo+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LR5MM3+bSCp10FaoOmox+CtLzVJ743mxyE04t93z8HI=;
 b=D1gZaNJeyjrnTwMoyev+5xtePw9sTphksCFKKBQwXSE23MQKxW0AJWifC2UMlWn61sAB3Qrkpwjv1Rs7mdrSFp6iIzD+VpcZUpmP5IxB+9bVFxRfePusP+cuOa9NW+hA4LHC8PtLZaF0V9ISEBfVzDJBvVFpaqGma5+LaDXC5q70p3PMqTHS6ZcNyxDt5lJpdQKcrkEg5PveVNCcfWiHH1dRuVBI3p/qia87E6PO1HxePzhtYcNBo6dLAeT9saiqrKrm5oAs6OzSPyuXQIgflJhXkmFJn2KbY+8hphm1aHTITirtwuVa7qbEyi1F2rqH9CJF+dQJIH8CDlMfl8IY+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LR5MM3+bSCp10FaoOmox+CtLzVJ743mxyE04t93z8HI=;
 b=KBkLVgjjX5oIIk0BJ01peqvQ+GbCMJsL1KECo7FIgASy9WpMz1bSQaq8y/LFJQv/uy0sjzrmMzqFjrHahuwyGGTgP3MaFUDxMO8SbKpVj+TECdim8Fe7MDUnLVDiJ6CxWF2D1f/uva6TbDUD1Cfdzr3J/ccRSneTbn2h08qQwh8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB9940.jpnprd01.prod.outlook.com (2603:1096:400:1d6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.27; Wed, 27 Nov
 2024 12:34:42 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8182.019; Wed, 27 Nov 2024
 12:34:42 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Conor Dooley <conor@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH 03/12] dt-bindings: soc: renesas: Document RZ/G3E SMARC
 SoM and Carrier-II EVK
Thread-Topic: [PATCH 03/12] dt-bindings: soc: renesas: Document RZ/G3E SMARC
 SoM and Carrier-II EVK
Thread-Index: AQHbPNyO/NJTh1WC/0KM88VRnUTf9bLIXIKAgAK487A=
Date: Wed, 27 Nov 2024 12:34:42 +0000
Message-ID:
 <TY3PR01MB11346BC7FA5C81C108B4E7A7786282@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241122124558.149827-1-biju.das.jz@bp.renesas.com>
 <20241122124558.149827-4-biju.das.jz@bp.renesas.com>
 <20241125-straw-oozy-f95e18e4704f@spud>
In-Reply-To: <20241125-straw-oozy-f95e18e4704f@spud>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB9940:EE_
x-ms-office365-filtering-correlation-id: 1dac6d22-612c-49a6-9a33-08dd0edfde02
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?w0vimkhlxucRdAR5Bn/0J+utFpiy+ZNhXNXdwQ6vuEbjre+NJJ3h+fUZq2ZZ?=
 =?us-ascii?Q?0VHi4J4VmUfa/m5ylJYBja5Up5f1x6My1CEoKF7zo7uMPv7GJIpd1XpW7Ufj?=
 =?us-ascii?Q?qYUphxHpetFEubwBdpzK6NrzVwDyNXq/HrpHIGYcraKLmjnCPafqU5nG1/tJ?=
 =?us-ascii?Q?YSDktRut1KB87nlPJ1OP7bSCpzX31gAKsGSf8ntUBUOPRP/HZD14JPcK1pU6?=
 =?us-ascii?Q?glkq7AST3E6ynoPaBO7faThZXTlCSrRDJ9M0q3VJIUfse/frkvq2yoq7GNT8?=
 =?us-ascii?Q?1/FmxKrDpDEmvzAynWJHBidkT5pO94TyXFsudWa0Dz4BSCD2gf0/EG/EHkSI?=
 =?us-ascii?Q?4XQF1tntoGQfRw9e/8g+S4xfxoe2bJuy+iMpqsJYFl5mhIoLOaBWVDzggQEW?=
 =?us-ascii?Q?nO2n/BOkl7rOxVin3JvqorFM8sN/3sJeLANrBiOXJNupypO1aVmSRIDuAf+y?=
 =?us-ascii?Q?+1vt80iHrnmpalRFgcNnWrnQsMkTmSOa0XDR/RQiYsO4KWxznQyuI7I/N4TJ?=
 =?us-ascii?Q?3Wf0kDnGLLs//LusZ1j5svoU88/bLtZkyziBmK0I7NR31HYKn541anmJEPks?=
 =?us-ascii?Q?4dZInHhDRGPcrD/erBk+ccG54YOEZjyDpgoIlJnD+m99rMkOgriybiTsrjmP?=
 =?us-ascii?Q?tZRuXGK3ttMdsFsK0ndO1M2kk/CEjhre9MBPcqGBRLuXGA0mGNVViHquXZl/?=
 =?us-ascii?Q?94U9uVU/RUT6gjJ55l2Q9lNJ1CF3800NuLiY7wucKYPQF75fIsXCEFFuOmE5?=
 =?us-ascii?Q?xVatchnacQJbfQm/nMT3GDLP07RFk8hcJ9jTqKz/NtZ0ftcfNJYa9GDaPUQF?=
 =?us-ascii?Q?WIRL/9M2ANjiuZ9ALZ8bDkSiFWy8bA/R0YvCZUrz0APG5iVJv1oU6VNSsaxR?=
 =?us-ascii?Q?iAe4R+a/9DUzJo0iROu0zzUTDG5XK/Li7Yx94n8B7QPEnozZr+4Bjet/iXio?=
 =?us-ascii?Q?iUSQZml8k/1rt4LMO337qS8DC2yF2MS7v7Qr3OHqoNVtmIBCZVBPMwDixjaJ?=
 =?us-ascii?Q?IV0L2Q4AKBQUAqKugErb+mTcaBgzPaoPWhcXKl3T/Ur/TEKENYYJcxgbzkjb?=
 =?us-ascii?Q?d2jVspdiVR8Q3wObA2COy8ArbDuq5REEdJZ8Rmvm9Ji9ELI8LwGpR5XIgvmQ?=
 =?us-ascii?Q?58oIsd+K14tw31pMY2ZPRRcKjcWhw9QBJ3pPv4mEiO8GRlnpUJASo/ieRyHo?=
 =?us-ascii?Q?q7piqnsOi1T3b6EcgeXsTIYB2bV8A0rvocjttfg/3NNP5nAYEVmdhTs0DuGB?=
 =?us-ascii?Q?ClWBg+7IRNapzxJpFhUMvEvqifhv9ZwAUQI+mEd5+qDLgqRrFJhRe+AKYEH2?=
 =?us-ascii?Q?Z0vJiVaZj0g8Yy3cxMwlRyRlHR8XOnL73ZsZTLEs1d22LvqpOkUxzgdTITKD?=
 =?us-ascii?Q?ljkPjFk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?vxp2I2zMllsxlBk2pOb3ekW/0DZkVDklCpyFxKO88RJ8bi9WvJHPCZzj86C5?=
 =?us-ascii?Q?Vh2LphKucfGgKPz2cqLs/EDbvH8oyQJLBh6CHe3LIxDdluLTluRYkvtBlB7y?=
 =?us-ascii?Q?ZfpxYvu+vY/9VTyZP9wRwUD6C92/z6giQWZVKCiOwldf1bowFoYBSBB2cTyt?=
 =?us-ascii?Q?Nf2an8W4daxL9sxwZR5O1RV15+dOWSZ5mvk+7HlvVnTnwruuKZvx3q2s3NKc?=
 =?us-ascii?Q?6u6st113WOft2QxNmYoUFBvkZ/u07y9KLnS+iNZy330kRgiIuCtJTn5zMGvp?=
 =?us-ascii?Q?dyeKtZBlHwMpXBUK5cNZTxwBNZTjCIMI0FNi6uveaM/99DvisOjxTed763It?=
 =?us-ascii?Q?5FXZVxavxPrsl/GM6f59SlAt20YA3SHdzB9tR50NSG/PXsYTBwA+WwB94sTF?=
 =?us-ascii?Q?FIxVAazTUrFuwMbLUht2dI0zGLc/7bVKq0D7Up/DpG/XuPBJHtZCTl3SydRI?=
 =?us-ascii?Q?BK7RSVIwZLHZPcqpvJMyH7GP1FEJ7C2hkLXaiKEBvuCdyZ7+rgvgD+vr/GoS?=
 =?us-ascii?Q?29VKaU0R/TP2x+m0sYX/6DCStgYhJ1nAYUmAyHkUhDgoQ5k4da3+M4ziYUdU?=
 =?us-ascii?Q?ovKjg4R08RrMISgm33URTieddlwGqPyBM5Wn58ZNE8YbE1NArfrC31lTa7Z1?=
 =?us-ascii?Q?ni2iTAklYbGEFH9+ZTLbgdHwzNHE6YAD+8jjJDdjLakL4UifInYAC0xlJ6LH?=
 =?us-ascii?Q?/naoADRtdIYhXbHOHcszlPt+8rwa2vedc6cKSfZonRVdRPFQ0HLZxGMYjSAo?=
 =?us-ascii?Q?QqbPFAg4bPTKU5haK5ZtYUbba0wyyCIob5A3EwTPuwztc0NLFJLOZXiPyoDP?=
 =?us-ascii?Q?lx/InJsr7rbP7QH9yeNb32JLCfsuXbL55uDQQYhUzmjLrgS8rBNZaGRNSle/?=
 =?us-ascii?Q?XNaBdUnWHYMXz6+Y1J1kJi6qWTMjJmHLExQVzWIK97wCbdREwEkK7Rwj0RTy?=
 =?us-ascii?Q?gL71vrQRMThlLviviDYJHknMU9Ha0eSGUO7+Yt9m3SEZk6/089qrkjB39mwW?=
 =?us-ascii?Q?ro9Ra+jcYmA1VhdXVEmz0d0LaH3Vs4UAKZGiN6UIlnwNcD+AV0ai2W3fYCe3?=
 =?us-ascii?Q?stLDP5aqHam67ymmqNrmqEBIMI01GtrR51FUwCwRpQvSQNxzl4VLetCpgXAb?=
 =?us-ascii?Q?TrIbNsfQI4PHAhJdQZ9j5proc4R5FEMVlTKReBeC9JBqQY7WIl//68brwT6Z?=
 =?us-ascii?Q?eq9vLQjmFWMpD0UJW6T2nQfUCL6QOYfk5k9TQUFnoXQwfQ/irYDelMC9k2LC?=
 =?us-ascii?Q?4xiLX4yGgWZcMG33pKTrOGUR7Rs9SaudioWbehLqLhpM6Ndf/2SMqn9Odg+7?=
 =?us-ascii?Q?EqFgKOejZim9j9wMNKE3S+rW5B60aEY+y7ynU39FXIHIH3j0v1br/OCVUlkZ?=
 =?us-ascii?Q?p8UFK1V0TBR/zTcXz4PwnY6d0QC2GCLGDM1d8Kae2fE7ibUzHufuR879HvMu?=
 =?us-ascii?Q?qvIvk0PU2n3P1XfO4zpnyX2FnKDDP2SlkkxfHaQT+M7dA5g/aTb5QZksWZB7?=
 =?us-ascii?Q?ybFSv6jCF8RUezRP4DPpYFBBIDoFH4CCG5TLyca7uMIOs9LS5B77z3a29s7S?=
 =?us-ascii?Q?qIixMGmlhmWpTf9DkKHruiJcUxLv62776teUCoFpHQcUBXVa9FH05fMkiFBR?=
 =?us-ascii?Q?cw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dac6d22-612c-49a6-9a33-08dd0edfde02
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2024 12:34:42.1313
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FvxMX83JZFnfmd61Ms+rvUnRY5I7lAP8SqmNqlJHLdLz2vY7HUpRYvSuqhysRK3hiL6Gm5kvwx3s5ohW7jfxcv+PYu3F331FbNOGSjvF/OQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9940

Hi Conor Dooley,

Thanks for the feedback.

> -----Original Message-----
> From: Conor Dooley <conor@kernel.org>
> Sent: 25 November 2024 18:52
> Subject: Re: [PATCH 03/12] dt-bindings: soc: renesas: Document RZ/G3E SMA=
RC SoM and Carrier-II EVK
>=20
> On Fri, Nov 22, 2024 at 12:45:39PM +0000, Biju Das wrote:
> > Document the Renesas RZ/G3E SMARC Carrier-II EVK board which is based
> > on the Renesas RZ/G3E SMARC SoM. The RZ/G3E SMARC Carrier-II EVK
> > consists of an RZ/G3E SoM module and a SMARC Carrier-II carrier board.
> > The SoM module sits on top of the carrier board.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> >  Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> > b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> > index 7cc2bb97db13..1785142fc8da 100644
> > --- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> > +++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> > @@ -527,6 +527,10 @@ properties:
> >
> >        - description: RZ/G3E (R9A09G047)
> >          items:
> > +          - enum:
> > +              - renesas,smarc2-evk # RZ SMARC Carrier-II EVK
> > +          - enum:
> > +              - renesas,rzg3e-smarcm # RZ/G3E SMARC Module (SoM)
>=20
> Why are these enums, when you have a single item in each?

I just followed the style used in [1]

[1] https://elixir.bootlin.com/linux/v6.12.1/source/Documentation/devicetre=
e/bindings/soc/renesas/renesas.yaml#L531

Other than that,

In future some vendors can add their RZ/G3E SoM's here

Or=20

They can use Renesas RZ/G3E SMARC module and use their custom carrier board=
s.

Cheers,
Biju

>=20
> >            - enum:
> >                - renesas,r9a09g047e58 # Quad Cortex-A55 + Cortex-M33 + =
Ethos-U55 (21mm BGA)
> >                - renesas,r9a09g047e57 # Quad Cortex-A55 + Cortex-M33 +
> > Ethos-U55 (15mm BGA)
> > --
> > 2.43.0
> >

