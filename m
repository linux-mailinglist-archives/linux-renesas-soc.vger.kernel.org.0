Return-Path: <linux-renesas-soc+bounces-31274-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIBlCc+K3mm2FgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31274-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2026 20:43:27 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 246523FDC30
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2026 20:43:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BF3CE303EE9F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2026 18:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28D6231E855;
	Tue, 14 Apr 2026 18:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="sMDswBaa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010035.outbound.protection.outlook.com [52.101.228.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356C231ED83;
	Tue, 14 Apr 2026 18:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776192204; cv=fail; b=eznyIoyogC8Hl3c/0Ru1Np/38cBhMKXqNAC2MfDL5LTpVAAr7LKIDnCotcYQaXb8hi7cfx3+CqVSCa71A6dCWzi5hL1GfHD5FuXpszeMBEIHPFMAMPKE83PJkjXSwwB+8gel1hPRX/rpbwEBddz+MsoWx3vCX0d7KRlQ5V/iF5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776192204; c=relaxed/simple;
	bh=KZ4ohgYjB8uAwxH7Cc4KFQ1oJVwfG5CqHfJZvRl6k1Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fU0BcbeC300Ito5xXhonBGNajxFwUYNQR6BYf4dRVwSuxHL31BSy8m8lPJe7KUMW14fM8n6uIRQpG39M+3yjcfSRZpWJyfPYgyVgD/L5V/PB14vSMDyKZOK9/SgA3r3kM4otpENyA1bsHkx8uRmxVrAc2SH4Yvv7UcW217zLaVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=sMDswBaa; arc=fail smtp.client-ip=52.101.228.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cri+fB2/kkEOJjg6AMv+ZqQoqqFiz+BIsSxyIJIMgwTCtUOHSPnCXTVJHKJObjZi6OHwRUsHRrVozoT0AAQHTSMdhnXoOxkPMBs/1FMR83oJ7ZbmIZBzrWWeTt3nH3ci80Im7zNxu/o9YSSNp1l4I5M1q7aq5bk/9QaE+IRAFDl57JxXmzUnlBBh1rxpTvo2ZJG9eNiCdCl8hqzHFeHIUo/xT/cUfeCVr9AxwzayzgyLBZHYtOnPM3MDDHfHRyjBrcJj4XmxIM26ab5aqsel2dieQw1H/Keo3AhvLbCcx5ZZt/l+5jR88qY1+n4Cn8ahEleXYERPW9GUNvS6s2gOog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZ4ohgYjB8uAwxH7Cc4KFQ1oJVwfG5CqHfJZvRl6k1Y=;
 b=AX92Q3anpGa40LrHx898qn1kNYLxK89v9VKyn5ZrGENkba2ISo4a2bPwEi3wYZCz5+wfXaPF/DI3QJNcEwgUbLg0oQ+Q1CeiYvYSkAduiQh9lfftqbAngTHaAdS3dLcSetueXUyRupX5H9SBpHjqgPnkZmHTwcVnZggi9HXICg67qfuozVjazf7x/G/6HMWeAPr5VjSMw54i5uLtNWJGQ1VqzQthy4rEHmk65+PgNcXr5whDKzPPT+9N4+9pmsaRsLPwMpODotWAfc4Sgzg+InKZjPDMpNDFnPaSyxoLhNEEfgGkMEKBvdimwncDtI5H0X7gAApRWi3iweLzmT9ddg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KZ4ohgYjB8uAwxH7Cc4KFQ1oJVwfG5CqHfJZvRl6k1Y=;
 b=sMDswBaaFpXMwsFhKl1DxaQVFgJ+baiig5Zjlpj24AC+SOUE9GY72gNZyiSmnzFRCxEvRmcgVuU6pi9R5T7FBuSKO/SFmyI0dRzwGnfTkFM/tsl1OaRGEmtwGmcBl0nRIo6CCaIR9JyPXaRCvpEaIkMIlFSHTPoZ6AH3hUbS9lo=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB12348.jpnprd01.prod.outlook.com (2603:1096:405:fe::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 18:43:19 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9769.046; Tue, 14 Apr 2026
 18:43:19 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Andrew Lunn <andrew@lunn.ch>, biju.das.au <biju.das.au@gmail.com>
CC: Heiner Kallweit <hkallweit1@gmail.com>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Russell King
	<linux@armlinux.org.uk>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH net-next v3 5/5] net: phy: Move phy_init_hw() from
 phy_resume() to __phy_resume()
Thread-Topic: [PATCH net-next v3 5/5] net: phy: Move phy_init_hw() from
 phy_resume() to __phy_resume()
Thread-Index: AQHcyoTCwk/y+FOuVk2TB1SqOfN5wrXeu0yAgAAsRFA=
Date: Tue, 14 Apr 2026 18:43:19 +0000
Message-ID:
 <TY3PR01MB113462DBCD0E25184E2B1630186252@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260412140032.122841-1-biju.das.jz@bp.renesas.com>
 <20260412140032.122841-6-biju.das.jz@bp.renesas.com>
 <b3521be0-c5da-45ef-b6bd-64e4a7b97966@lunn.ch>
In-Reply-To: <b3521be0-c5da-45ef-b6bd-64e4a7b97966@lunn.ch>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB12348:EE_
x-ms-office365-filtering-correlation-id: 969f3392-2073-44a8-d7cd-08de9a55b28e
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 3hzXnuatTSgHg6EF7ut3Lg9B17dYtxKYPgwrq0598mBDG2k2LF3gTHqEbAx55SlpIHoiq3dNNUJEnWxqc02h5u/9NAKSIbPaepjnVY4n5o+67S9XxhownfRZ/jHeoSAWMfCVKlWnBkWW/z/ae1zTnujlHMbyCPuOHV8CyVA6X9+yeFaoM4CnWF89+L7agRyd7fU3iQO4wH/vF1nUTCTFsscGhDmTSntud4Pk+bEXFcEPKmPJWyBXAyh+CCdoBJjZoK9SDh/PxQet2/DKOjuuTVv3Pe4cC+05ivgtdGipu+goPF7vgUcTEPNPfj4Z2aOtOHgSh4XYrUpLU0JzNgkOMUmbkLwonXxfzx22A7Xg1ReZfnUgr/7tuZSPQeXHfcaYGUGWyXWqy7bf6NXIl723DggF2Lk+gb59Tjxm+VDGo1H8l+fec6TwD8qRNnL9X7m4TNecWJdt3z1xAHgkdbrvuTmhoZSRvcjaSiTGk59o9xi/2jXSqrk88cdV0M77pgFAunO8MgqbWOaEW1O2WOxWZTZ3mC05fpbStY01G5abaIWVOEgo0opt4YN5feu3Vt+VXuLJ9pTNQ/cGV+RabLOoz2Era0oMbwl3NwZAvHl0QQH2md1gw7hNZ+liTBsrSQWpMz31tNUHdBVzoBF/2UqwkUTUXZWPtRrAadkoMP2+bEKp7TNeoVUlTB6ubsdBCiCk2AVem3QLRp6GWb7wlFVHndAARBPl73Gkx4s01ajgyljjTvaRwZPtCpqZneW92CSGgyuo+371P2HztDzpqcaOktEcKe/GjlK8+u4ijuO/RY8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?hGc2WGAv8MXHm2vHbzD6D0Y1WRXJ2PtYTJ1PQJLInN7QVLUJchtXWyDFoLHh?=
 =?us-ascii?Q?Qf+QOt6EXNr82dCazYkc6f/9+Q/ZNzaqt38q8q6rKgfd5vxgpzvbB/06Y+cs?=
 =?us-ascii?Q?khsHvdi6Yq7AOuTfb9MzKBX7NYg08mL1fr7QPaC6rOVAA3jxBY9UkOUTJRXj?=
 =?us-ascii?Q?s2vbetO9kRbth1sORaiMftV0B10IOGvAzoYHalCwpHqtOIVh0hSPbj+LgZei?=
 =?us-ascii?Q?Z7b0ZJsVbQlgOVCr0M9rrowg6ggq1Y/b2Fo8un+MPoOmzzFoKmOalTbVbdb9?=
 =?us-ascii?Q?3z9y6u8RWXlrZ+e+RmwtHXHvtuZXJP+wnozrOFSiulXAYXWacs/CydDlNmUS?=
 =?us-ascii?Q?53uPr47KOApvibstFvvH3L9jUw8VMwCRpaw9LS0hLy4LsHvu16JAo6PrrxFk?=
 =?us-ascii?Q?vkaEH8pgwJbUuH03YpJiZ6e9ef8h8cL54Vkr1sjXPsLlPmevEHH4ILIFNBd8?=
 =?us-ascii?Q?myaF2KzEzY4J0pnaZC2DLST52aMMMPP7wStOqNFheL09ZqGerx8Fmu74N9ER?=
 =?us-ascii?Q?8VemU33gLt6Y9GMRfWMOK3BEXnFyIICJq0B7/Q19zOIb6qevKuNftz7xHoF5?=
 =?us-ascii?Q?ThPe6JUnxWnfNYxpvfCpPSBD6ikxqWuif3+lM/pgA/XNeuAWI/QjqbbVf6I/?=
 =?us-ascii?Q?WFtFjAbQZXRWgL3E3bfRBBu2N5Oe84z0AxHN3N2WQ6uZdwpjtnqdON1ZlU4s?=
 =?us-ascii?Q?EIICFabo+AoCdcZ4Bcp4Uvrn+3BER6znY7+h26po97pSEYpKdt3seVi04WS+?=
 =?us-ascii?Q?FoV2YHuCh2iBwTPE8bB/JfuKeaxh+u5Ng0F68QSn+sUSONHWkFFuN1LvjPrl?=
 =?us-ascii?Q?6y64yo25kxDTat0J5JNP/hTZjdc7RxWCn530l1rowANXvhuRG+nd1vCYUny7?=
 =?us-ascii?Q?aS4QG4ODN6h6rZ0aoaqEd3xdPHI8cRJEyhkBxG5+gHNCVGyfdHMSNx2UkEN7?=
 =?us-ascii?Q?4hJ6FfcZPgl//U3pEI3y20HcN373HN2231McotVXN5Y7qbPW0tg0XXtz3zTI?=
 =?us-ascii?Q?uPgWI0059LgeG1RJZRaQ5rMQt8CU+DqY2lUYZhkhbcdaV6NSXBhfyUdSVrtl?=
 =?us-ascii?Q?vDOGCEa6qdH5W3bbqETSgNv6TcewSZCvuWQdMacsb+86YTFA8iih/Xwy7wUd?=
 =?us-ascii?Q?asdS1aZu264i1Ye3xUyKxCoOlQrVkSvzALJcYtJ6WfJymrdFeKqq/CUk/Vh3?=
 =?us-ascii?Q?/C9AMxmqjfAsHuT1qjnv1mAphmtMSwy7/bvGIn/Pu4IRnXJQrvD3rmi5Rrpp?=
 =?us-ascii?Q?kGxUPgQAqrNJCWV4uLG8oKXdyKlTcKqcFBPcyrl8kuzuYweVLS0a4hfazFoU?=
 =?us-ascii?Q?yxyQPPXOP9YBOEostK1Eymkr3kZ1eIm3gbcjT/oKlPu9EVQDCFYACWHBHd1M?=
 =?us-ascii?Q?H4xKr2aBf+uWh04vqXy4QMBL1Y0AbWveFDDfayr7qXrvyhLBYaaN8t7O5ANe?=
 =?us-ascii?Q?E0D67Uw0kV2Q1VY6NDOW59QGHSPjx8M87SWfg/axRPCrV5nVBs0b3sbqVUVE?=
 =?us-ascii?Q?yAP93fxtaEKiHEvrbwAIhlct+mIhBJk7go1tbet396kusAfah4MyixCbJB5l?=
 =?us-ascii?Q?90LvxLNUCDU78q5okhZKH7lRwyH9hna/ZD6ZdjQ2OaFdtt5k8NaybWUCo9T2?=
 =?us-ascii?Q?qSVtd8NZtVhAlbnH1zTfa+fAIKXzZvjDCmxufjWYMS6//rxDxcm4J8E40xjP?=
 =?us-ascii?Q?9H/m2F7hOeHZZfIqqzX7oeMnz7tTSc9PwmSd3vo/0oLg1UG0nUP5lgO8ujAZ?=
 =?us-ascii?Q?OKSDGt/M1Q=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 969f3392-2073-44a8-d7cd-08de9a55b28e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2026 18:43:19.1410
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rBqCII7RWFboNObVpG8aHiKiAyIFx+GueHRiqSNxcOxGC3HqUDzKXG7yNe6ewU23R82iZRm8SXDepult3Fp2PJjzTzLRP9V5Z+40Vy+S5rQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12348
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31274-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[lunn.ch,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,davemloft.net,google.com,kernel.org,redhat.com,armlinux.org.uk,vger.kernel.org,glider.be,bp.renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,lunn.ch:email,bp.renesas.com:dkim,renesas.com:email]
X-Rspamd-Queue-Id: 246523FDC30
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Andrew,

> -----Original Message-----
> From: Andrew Lunn <andrew@lunn.ch>
> Sent: 14 April 2026 17:03
> Subject: Re: [PATCH net-next v3 5/5] net: phy: Move phy_init_hw() from ph=
y_resume() to __phy_resume()
>=20
> On Sun, Apr 12, 2026 at 03:00:27PM +0100, Biju wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Now that redundant locking has been removed from PHY driver callbacks,
> > phy_init_hw() can be called with phydev->lock held.
> >
> > Many MAC drivers and the phylink framework resume the PHY via
> > phy_start(), which invokes __phy_resume() directly without going
> > through phy_resume(). Keeping phy_init_hw() in phy_resume() means it
> > is not called in this path.
> >
> > Move phy_init_hw() into __phy_resume() so that PHY soft reset and
> > re-initialisation happen unconditionally on every resume, regardless
> > of which code path triggers it.
>=20
> I would change the order of these patches. First remove the redundant loc=
ks. You can then put
> phy_init_hw() into __phy_resume(), rather than first moving it into phy_r=
esume() and then
> __phy_resume().

Agreed.

Cheers,
Biju

