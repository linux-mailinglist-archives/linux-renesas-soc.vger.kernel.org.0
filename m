Return-Path: <linux-renesas-soc+bounces-31856-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJKJDjmA82ni4gEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31856-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 18:15:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7515D4A5856
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 18:15:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 821313085058
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 16:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18EA145BD4E;
	Thu, 30 Apr 2026 16:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="le3mimH5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011034.outbound.protection.outlook.com [52.101.125.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C131044E046;
	Thu, 30 Apr 2026 16:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777565275; cv=fail; b=VIrjs/jjIx1AvTmylYEpujl9BdHxeIni1k+Bq8nfATGZcZnRerKDdjIDv8+TVVK13nCV9l2rvcdsQ7QLsUSGqBE11eWIRJmDi5uOzHLBWdz+hpPg1/8hmk/BYO2URU12V5xAj4JOTVIv28E76SoXic63keLIWnPmbEFVB8qJ6dE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777565275; c=relaxed/simple;
	bh=DoaQtfxBRa/lvZofOce0XWxTIqz+IRU1Vl+jUvm/oPI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EmHwepS0Uh9aIr22FsgHaU6ZE0Txy9MfWpyFsyO0lynMwQ+M61of+Ej3AQCJadIQ5PHVE+7BUrdwtgbpDfJ3h8RQ0zUlnTUZF2SevMBFB4JDYNHr8CONE9DrzJZLOeNufKnpuLviwKcsfDOtUDZ46tzPI4WWkuNv8b5Y4OVcosE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=le3mimH5; arc=fail smtp.client-ip=52.101.125.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aW0mG+xuPElTzMQv5KZdwQg4dnKCF8OJ4fLzxzZAl6ywLtC0th3qEJtV57UnimnA+0e1OaqYKqNFwenrU1+6zzbthf77vepJ3Xg9+3r7RHhu1oFseCBkayzulIDIuKVIznvf/rBVqJaLYyHs/hFw/eiICdPBxCr8ipT3KOCfF+7wi+jI35l8Rlk9F/7rtpf4B9DCa3S+3AaiPIMLZgl0U0mMF73xPe+51wAJXmMkrcwYcVFcbxsx3fceltxGGqzdibidSkLa0Y7vft+u0jlcTORtv7j3LyMsC4B5pC5UkOizxA02gphpDpGDdE0aUNb5yvHhL+bkT+Yd+5zom5mRQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AwZ6NMlAQmtuZI32R7p5iU9qi4+AbJoQfp5PfcDFp+8=;
 b=l5TiOfRO0x26DgMWgnRLcSrvwQ4QdOdE9Qb+7jyebwYgfRwe0qfON0utm8tf0aqiPUVZovFiISRwAG300NPNc9Ca1CWmCMQUMlbx53vxBNPzxCJ/ZX/1H2XdJWFqwpplaMHvoYnLG666dEaU7YqUHFoBfMWQpYQ6P7tjRei0I6fyi0weydv6AFcnT1lKlmqSSvOGfwUEmpD5jPFt4r0Ec3klP+ZCTpdP39gtHWUM0F+7f3vGhkbJroUC4I135pXG9bZF4sFX/IDFZD51fi6cb3plNCzZ9flPMynqCzj320qmPYF0ttmcNPo7PRIVCotck3d46j4shYG56Da3KaSuCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AwZ6NMlAQmtuZI32R7p5iU9qi4+AbJoQfp5PfcDFp+8=;
 b=le3mimH5HMp6D14N1ZkR6s57W1cLc/3/bka0fcMNJ5H5A7L6yxsnGnxVjQ8N1jpWJPiqFO+Uea2G+vD9wAG7WwuCXsMOTpKek8dJpkqcneBszkY+g15+4TF9sTZzBwLIjWRQYxxJqJTAlSjBKMTI66qI1zuzLnJDXLefu6Wtxr4=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB7236.jpnprd01.prod.outlook.com (2603:1096:400:e9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 16:07:50 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 16:07:50 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH 3/3] clk: renesas: cpg-mssr: Add number of clock cells
 check
Thread-Topic: [PATCH 3/3] clk: renesas: cpg-mssr: Add number of clock cells
 check
Thread-Index: AQHc2LTgAiU0FXSvsUi/6oZwgSA70bX3xEPQ
Date: Thu, 30 Apr 2026 16:07:50 +0000
Message-ID:
 <TY3PR01MB1134616493F57D9E003D0B09B86352@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <cover.1777562043.git.geert+renesas@glider.be>
 <46e010659ffdffd5e3541369f3b65d43ebe236ec.1777562043.git.geert+renesas@glider.be>
In-Reply-To:
 <46e010659ffdffd5e3541369f3b65d43ebe236ec.1777562043.git.geert+renesas@glider.be>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB7236:EE_
x-ms-office365-filtering-correlation-id: 300b73b9-caf3-4fdd-ab79-08dea6d2a0f7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 Jtd0l3gAbTBmXx4xWSIXxLwvK/02uG7YxHIP6rR7CV8jXMyHi+VNxkWtnPstej9J5lGb3WiOMkcvOJo22FfA2dtbYiSL2B5zYgVCi+6aaYu/6ku5qjO+iqVQe0012SrA/cV7YOProBKvmNXpfM5iIqPw0KAZmUGd8cKOi2JMzoyi27cE/THrtPshzcizMbfC3+Z4uyqx4OxUvJ25hAZ7vVmADZbWyTIybZHud9IFHerqIQIdHM4u5MtleUwTnotE2OPMNYkeJU2QV7wi7XuGHcXFRun27UBOX5ZYmsph2bcGclsq5B5E7FG5/q8z2htzVgkuOnQXhe8cq8yUF76xE8r8L007ZytWWruxpYTUYNFlv64LneUKbgcRZb5k27AKK1ebxH8Re24jnUk+8RQpw2h83mBLDcM151pGAsnsPhtDLSr3LmyfEbb0WsVAAPWi46M2+YjakTKkHXy6sBG6oy6nlcQLJcb16ABvoojPQjZnCpPxo1ti8AaplnxF6TY7p08BMnaAxWLwljhtGCifMG66z/A1/UAVP3bkJQrwao4+RcSDuABxTauMZcrY9o40PO/xE1WZ9ki8cpNPCIpSJTPXeeGlgbVdFx6TkstsDs/z/6d9sM88DhJIq99FyGQc5Cnjoudof096jzMEPf64LaMrRitRHFk10HXm0/UAUPiK7NCvOh/9r1qURSYEfMwAMZeJtZrj6MhPmexw46jNaSf7h29KbEHX6JFliMbKnWBfTJD4g3eS1p6oUinH1mrcDqY+riWOkZi+1Uvq5AqwiG8ldDtiyQ+LbYqQKZMjXio=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?X118tdfquRZzP2m5L88d+FvrgJfHIhw/TX0dLhsuJgIhyW1RNWEzYSozZ7xM?=
 =?us-ascii?Q?5ZV2MPA93r186fqy+a6wEqTGf8MYSF6g9b6zQ7R8Pbhnev8p6j4sGi6jclgy?=
 =?us-ascii?Q?bEYB6FYPKu+r5AAJnpDwuyU3VVnldSs3Md8YfYuCu22i88Z1DJl0DswxcxBW?=
 =?us-ascii?Q?beaZT/EOnHE5IY3Gz7IVs7iuuzsJNsYGFq8Ot1v8J+N/B/L2hDgaQGRKWhry?=
 =?us-ascii?Q?7V+iwGJsj/9grr79xv+MpiQXOPeiIpAl59lhRpbaGRWULHyGF1oolE59l8ft?=
 =?us-ascii?Q?2PVSHJUcgSZYaUbBR0lMNHhsrfTA0jtGgGKGEuP05QHhJeGU1SvMRVmwJN3V?=
 =?us-ascii?Q?78g8Hilhab5o7xxbTyD0rNvraecuN3pR+VrSuQiXjgUM/tfc0t3a0/+camYb?=
 =?us-ascii?Q?g8js7Uk8O41hCWOillRKv0OjIIZg93JIBaVgJ0ycMYlHy2EhJ4iAQuNRbofF?=
 =?us-ascii?Q?PeR9DIV/5LX7RchNhkE+vdS9XLSMMTVNHZfH6aG122PrPlsjXBlxm0A/AEd2?=
 =?us-ascii?Q?EY/Ux+Zj9KqyYfUazO/kegBQXmWWL3umpyTzNKSCMaeztkNZY/IuUDL7fvup?=
 =?us-ascii?Q?lzSpoctwFR1t+VQHUWbZeoawGewBQcvbTqufxR8Gim4DLP0kXvk4mr6imwGb?=
 =?us-ascii?Q?fifp43pCHzcPeMH3E42wgzb6SBNw8CYkV5ahDzMpHl90e8GVi+LQR+C8ddU5?=
 =?us-ascii?Q?mXAp0HgWW6aSYzn+mCVv4gQdCmyvLdN1ZZJn0NjhC6fsi3I8I8QC9nk123kN?=
 =?us-ascii?Q?zIeSij4E7HklTwOX02ObRrFJJc3v/ahY2/iV0sZEgaoiMZ8zX8xQpm2GRkg6?=
 =?us-ascii?Q?fZQmfC1qs8A7qiXaVoZi2hQAh6Sjmu/xZyvn4DKW3Socv9kQDnAoNHpRl8T3?=
 =?us-ascii?Q?lqup10TgfcA6JDyQnejvQOQTxrV+GIfDtNGUOJa1WqJ5o2f829Q0fbWlywRP?=
 =?us-ascii?Q?/wzBdIUmcwFIbF/PLlDzixrBeSmVVobyTA0UtO+L3KIyjiLrwL36hIzmz5tk?=
 =?us-ascii?Q?icx0oKowGB6duoixfGQt+2gefJMHFTGxxMUWlmBTVkTIn52NpAHAQKbGThSZ?=
 =?us-ascii?Q?h1CbAOA7O7Rm9/Aq5xrgrE0sqq3bpPaigp0/mFFmb3NkCCq7VmldCMTXM/YH?=
 =?us-ascii?Q?5FpJz3OvZDn18N1uLsvAWqcPanBH8mTgTM/eordNFapKKCcFvi2sGKA1DsZH?=
 =?us-ascii?Q?3kutTxroJyr8sehphIUJv3VPYP0Crmm9wiRJd2TFwyBJ1MY9hQhbHx2+rktj?=
 =?us-ascii?Q?MKuJ3dnzx+6gppjoruX6e676ETE1A6TJAd8Xyf+3Y+nXZ2ebDAC1oysTnUJy?=
 =?us-ascii?Q?1IHlmrxBqmJfvQPsVhs9alQ1w5DWkksn84XbUe6Hl38rK8Juythmo2g1poWl?=
 =?us-ascii?Q?qX2kzMacQTcg9aMCawpiDw2zaR7byPk95Uo3mhK+4+E62YL0RXxk7senbH/9?=
 =?us-ascii?Q?wb2ZXmrRZUScASmDh3jlI1JV9poOw/40/8F1n91IotIakx2g2enyRl5x6Oz5?=
 =?us-ascii?Q?3XLawIApQbyeIgM8+DrPAfTgENDJ32RG/DSCu/Ugz3DtFPLmUDKKUIPiiO1y?=
 =?us-ascii?Q?5AZu4YhdLqmifdJgqG1wRhf1R5+QnqEjgMAh8UAjs/fhrkkyucGY7UyONM0N?=
 =?us-ascii?Q?sDaeO3lBjl1M0llUiIXlEIhefTKduYDgv/D/FXe54InGJC+S2zsGsLU/xvBY?=
 =?us-ascii?Q?CWVlhxhJpMXVM4yGMTYZzWIAjKybvHaZnaKkRw2UQSnlitSVLWlaEqJZc6z+?=
 =?us-ascii?Q?L3TIQaI9Zg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 300b73b9-caf3-4fdd-ab79-08dea6d2a0f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2026 16:07:50.6877
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yo9LXqw1eVNa2jlWHO2qquKisJ1tv8DoyLspOswLJTCAofX6o3NVP7VlvchyRFuK8DyZfo1j/E3+Uw7pvRYgj3Sc3F4K1dR3p0P3DXtzHs8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB7236
X-Rspamd-Queue-Id: 7515D4A5856
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31856-lists,linux-renesas-soc=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:dkim,renesas.com:email]

Hi Geert,

Thanks for the patch.

> -----Original Message-----
> From: Geert Uytterhoeven <geert+renesas@glider.be>
> Sent: 30 April 2026 16:20
> Subject: [PATCH 3/3] clk: renesas: cpg-mssr: Add number of clock cells ch=
eck
>=20
> The number of clock cells is not validated in the clock provider's
> clk_src_get() callback.  Add the missing check.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju

> ---
>  drivers/clk/renesas/renesas-cpg-mssr.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas=
/renesas-cpg-mssr.c
> index 26ea85cfaa02714f..5b84cbee030b8a1e 100644
> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> @@ -370,6 +370,9 @@ struct clk *cpg_mssr_clk_src_twocell_get(struct of_ph=
andle_args *clkspec,
>  	struct clk *clk;
>  	int range_check;
>=20
> +	if (clkspec->args_count !=3D 2)
> +		return ERR_PTR(-EINVAL);
> +
>  	switch (clkspec->args[0]) {
>  	case CPG_CORE:
>  		type =3D "core";
> --
> 2.43.0


