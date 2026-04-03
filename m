Return-Path: <linux-renesas-soc+bounces-30813-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNshL4wdz2kjtAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30813-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 03:53:16 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3D03902EC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 03:53:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 38F42303E75B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 01:53:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB375346FCA;
	Fri,  3 Apr 2026 01:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="YkxfOuyQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011040.outbound.protection.outlook.com [52.101.125.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFA7EEBA;
	Fri,  3 Apr 2026 01:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775181192; cv=fail; b=AWX/is2EpniVqofmzc9T8IlrPbRBCu2C93Yxa0iiSYBtVfqUtFTks4TmRK/XY32xUQtMiF8UWHHP2PiCVjdTbYrr5+F4OTEwBGBoFSJg5fzhJU++39FVja2WKQ0Gu9cWdsgoGBGXC0fBtP1/USexQV7a6/O81s+MgIsOwo/eLwY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775181192; c=relaxed/simple;
	bh=u1I3+gvauw4cjKDhP6FI2TazQeM7OWrwcybbaSZADNM=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=qJA9cuHWepu2wmclghl8INt54/M3Rm8v10supMvbfyzDAgmvBb3h4pJGe1nDLDCmGzuQlIVsusSznKHjZGtdZlJXRaK5msIn12mT7g8o/2AvxwNqX7E2gw9wQpN1BUwXyPupFJ3j8tBCgbuPoThg4ZE+Dxlv6cb+Fg7KWKTz5d0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=YkxfOuyQ; arc=fail smtp.client-ip=52.101.125.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fmCjLvR4zhvM7NdpZiTNXee1gi/IvbD/kx3WlZZJn2Ft9jbuXbcNluPOAdjqdtNfTsxCVm3RnrfkfoUIuLhRd9yXyCsPeK3Dgc03Ul5RP0gkidPG5Py+ynqrlvu4LKwVdTJT5sK9IqKTqSJ8g2bLrr3heHAS0sNWNKo3ctKExFnoiOVGik5zK1MU38U5NSdOJ/uRbw2WU6Z+i3vU2mgZmb70sIrd7tkrqpgUF4NcC2cqFzrneBAYV+3WviUID33lQKT+fsrxJLg0t0WyDdKA8PBPqkHnia61VB/4XIHq6iPUsfQDFeDuJGlb9N9+nFjO5/EuG197wfBPrU2djY8qEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w923Ax1mFwwwsD4EgS9wuEkN8oOPImgKAUty3s0At8o=;
 b=Lw2CoOEijRZWKvkdMGQOXgqGmjgKCZgq7x4qczMRcb1tWAys9wUA7AnlDKdegBuMxHL46AHwxe1z1dj1+Qnr8DaPLbhLomfhr8XhzLvfhAOP+fhbskm5l8W7DzQzuufazxugmQZ+P9LDOQs7Qcb9+F5x5aKhMJQ3MuBh9hKSQtk6/L0utOVrMzcNr0HaaPt/XnPuaQB8m/9yITCsuH9uI7eOKZxUMz6ZRe+e5EozvPZ9jU9z/KXflt0NJQHo/B5kdfU6zxHeHmIjzHXqPLq2qzDZRl7IM0+A3rNwtG+3llpXHagx0fCszEPIRKdoOUHDIOgNuxM8Qyv73VCR0RZw8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w923Ax1mFwwwsD4EgS9wuEkN8oOPImgKAUty3s0At8o=;
 b=YkxfOuyQmtzkAbZrKq8Lj+UZ6drGfNtaLiZI3McDhjtARMEP1UUvI7ZRP0CNVZ42gF79HbI4R0LQD+zINgygaBI6n+gZ87PBDacISjabFHJnn+wusbXAOsFSF5UQpYprupZc6uRYtry08Cn8M8vutcUcu5ot4HxoHpnosGGK/y0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYYPR01MB12451.jpnprd01.prod.outlook.com (2603:1096:405:f6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Fri, 3 Apr
 2026 01:53:08 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9769.017; Fri, 3 Apr 2026
 01:53:07 +0000
Message-ID: <87eckwg67x.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	john.madieu@gmail.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCh v3 14/14] ASoC: rsnd: Add system suspend/resume support
In-Reply-To: <20260402162436.12059-15-john.madieu.xa@bp.renesas.com>
References: <20260402162436.12059-1-john.madieu.xa@bp.renesas.com>
	<20260402162436.12059-15-john.madieu.xa@bp.renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 3 Apr 2026 01:53:07 +0000
X-ClientProxiedBy: TYCP286CA0111.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::16) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYYPR01MB12451:EE_
X-MS-Office365-Filtering-Correlation-Id: 59968043-0f7f-470b-cdfc-08de9123c085
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	oZTOdW344Q5i43frKiNrmtv1fXKj0XcOTIb6Lh4DsL2EmZBZqhjGB6Fl1ujhRyhcvjaCAbhSx7GrU+5bkFza1NBlb8x5jBDNGtWVWM3Jw3zKnrTut/J78KKd0OfBEotmhyIXNqq/ZHvMebNAJ1N/g7RVF1NmnUcPvobhmepRs3j2JnWxsrEQm9daWDw0acgS/DJFeMUeSK85BWiK6FQiU9dlx2HFU1v18xOZOtByxw5NLSgvECJbzThV4xu6fDKx4kKDwtYi/1nU6BPxxX2ffZGbgBJ6CKEYW8DqB7XFPKq+tDtwW78LFbARNxlqHdxIHsRmyLIr6xIR9Km/SGMijKsFpf7Jqq3hj6/ZrEj45zNybZfXuG4dpQ5o8YUKA8WWIEsTGsmRG++l0BfankHGYLaT/538KDiEqhm5hmZX6RtHdXVmNhyQHi/+d/wgcGzyG6CXgBvm0wD8Cj29XZfGt4DU32qKPhiWXkpoz2vISMj29dGNvI0WX1Fp7mn8dtmn7HrjT6LMPZwQvL14jzXn+hplm9HvPaIgXbjzuRDqlv4ipRhcmArFecuUb4tHIocXUP+qE03OJEUM9Q7R81aHw1KWqy68UpjolLA/bcQJE4MlCgjHjNrmFjYJvg9Y6JqYC13+iMF/UwyMi9MVSJFhwsmEYpNVBaoIj1buKsVt/fOtn8717OGkH7ZyQ3b/75rYPzur80MEa/dxLQB9mZlqhkM5kAjxDq/mZnI2GulyDMRBMnackUyxAnp0K1F/3eq6oxPxMH27KFbVQ29MFb8v5KfGPpRYin0LrQv/K10h+XI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?s3Ef1UJvuk/eS+4zrQNsYKpIZPbu3WsgYEBgPnT4pcyNOrDclL2gNUlK4owa?=
 =?us-ascii?Q?VP3Zdbp0S3scmCy5rywWBqfSroTC/o1Erqi2ZNGRI+cJx9lCz9y4/XMx3gL+?=
 =?us-ascii?Q?4PZH8vDQhDZcVvVzIqIXPITogs3hOzCLpCHPnJ4TpASoF+UeAeF4dIqdK0W0?=
 =?us-ascii?Q?OBR7e2NiEad02gDGr2ARMwvvSbvB32z8kxSBo3KnKObpTHEF5xNLpQCv/wHG?=
 =?us-ascii?Q?gLci+coSrb4of8WUsq857DJA1l51JKA0vOwf5dlNHBHN6XjlPDdkGFEogH7j?=
 =?us-ascii?Q?eQu4yEQDTUu0PBl+Yp5Em93OVx0ZOQayILhVlyUj693oaY1QIKXh2wPBZIaJ?=
 =?us-ascii?Q?hd95k5ovcSyistLpdbLo4CGt/SeByzXssKV4Z89i2B6f9Gdh/kAIAdZ7gSro?=
 =?us-ascii?Q?hKeOx79nbNFDgCE7smPz5QS2sTXjs6zvDQlWQPEgfCx5hxNsmbeoCuk/Hkto?=
 =?us-ascii?Q?552Vr+LBBnkhSohmezxDg9fcEW6zjFCVLGA+NxttVxrIvDVAyIy8sITsmcl/?=
 =?us-ascii?Q?H/0gpfe2UtmV/sxpTfzuB9H+jrXT66hoPCamp4PABPtQvHr1WetpjTY2is2v?=
 =?us-ascii?Q?/rYfN6lPswaB1YiDUbB0hKMvBbsnKQcHPvZlyKX3ZbSnABSTbNVJO03JzCp8?=
 =?us-ascii?Q?GNzBqoslN/gj71PZJKQxFhlIVaa895h4a2CC5HCujlfup0rKutsfmYklJpS8?=
 =?us-ascii?Q?aIemE1quO6Ihd0Hqw2R0AuqMqeNSCxpvXmieLJG/ZEV0vWwn+YFkPGZz7cGi?=
 =?us-ascii?Q?lCAoWnEVfaNIYEb06ZdRmxY3Gl3t5PFH6fDHxf6OBeMKWYym5Sv/LNBLjsVh?=
 =?us-ascii?Q?+1czsaYQRpJHYNgRGbDHNN7Q0jZsWuZYujwdtnXljoe8UU64v4n9pwx7ZMtG?=
 =?us-ascii?Q?WfFRIiaIQh1ZnFVRV8zjbslDyys7aYq8QfhBvCl1wnVe0RvOXT4hRZRnvHEZ?=
 =?us-ascii?Q?+rxVCrsg5aTwqifu7tSC2dJA8pGVtcs2L2VerVYB8JspA+X1EUyrjzvIHw3Z?=
 =?us-ascii?Q?GmZCzc/lEoqfIZy+/CArT0iZoCeqs9GGYJB1U/kZySFdlEMd1P0SnxMXEnYd?=
 =?us-ascii?Q?GSQiqgkPGI5vHf4Wd6byl4PoDGDgptFGvV4JUHmOERbnx39CO4X9Ic/b+Sbr?=
 =?us-ascii?Q?vC/GqVm9pY6slPR58het6ehdsKXDcap08vuiZ00wpiAyukj89Q7cpRbMe8R4?=
 =?us-ascii?Q?oL04+1scXvEpTn6debm0LrkIZarEXIJy2EHP6A8ExUeBIBpHSHIu2fUfGiC2?=
 =?us-ascii?Q?nGwWHJY8OtzDx5sWGjzpBodDzgGofhlbVVb9WJLlSGz6ZjTABeZ2VUI5qXtt?=
 =?us-ascii?Q?gpiM7Bdjv1p3r2CpBkxh6E68gOx5RWzvvyIQ5IyOWVIgWOYjQNYv0IVcKyFw?=
 =?us-ascii?Q?/BGbBK+I5TTLf34GwNhaAs8FPbFUamc8q0tWeI9j6F7vWFDB3C7/cQGeu9Cu?=
 =?us-ascii?Q?B4u2U6UQLrfW/dPoWz1l/gq0faANtDb+LftthTyC/Mn9BPilS8P0V7z4DKDD?=
 =?us-ascii?Q?a+FvfVZUfsrhQB7Iw8ybD5dqhuPVAUoKPfIjWQcPRJDTlGxASZreVHnx15Ky?=
 =?us-ascii?Q?ggDSDdlHlfqmvr9d5s+OLukY4farfZ49uh1r2ESerxUv01AzOKMM2qHZoSsJ?=
 =?us-ascii?Q?Zt9uDucd8Be1MEVUtKPlbFdYAtPOpkI+b0NO1FD//UQhqI/d/zkLWlAD9TO+?=
 =?us-ascii?Q?K7RikyiIftGcuBYU/RQLDlBWIxVkCSHUZ6oq6oQOwOsYY/bH8LYve1YHK66j?=
 =?us-ascii?Q?ATAKxr1le8qBQ2dXBwZ4UWXzLPEB98scyqQ43PpBbPqMzuM8mFm6?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59968043-0f7f-470b-cdfc-08de9123c085
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 01:53:07.4423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QcPeAOXJDxXOEgcNH6eMPhkghIolvOQekzjnJyOcWUn2y9dpMvjfLCPfPyAq5SRBXieiTPlnYcZuvpcTDY7nc49TLTk5N4wuEMSCxRffyx5qJ+S2Z1as1lQCWKI0mR5Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12451
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,glider.be,perex.cz,suse.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30813-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 3F3D03902EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


Hi John

> Add per-module suspend/resume functions following the existing driver
> architecture where each module manages its own resources in its own
> file. core.c provides common clock/reset helpers and orchestrates the
> calls in the correct order (reverse probe for suspend, probe order
> for resume).
> 
> Infrastructure clocks (ADG, audmacpp, SCU) are managed globally
> using optional APIs to remain transparent to platforms that don't
> specify these clocks/resets.
> 
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
(snip)
> +/* Per-module suspend/resume */
> +void rsnd_ssi_suspend(struct rsnd_priv *priv);
> +void rsnd_ssi_resume(struct rsnd_priv *priv);
> +void rsnd_ssiu_suspend(struct rsnd_priv *priv);
> +void rsnd_ssiu_resume(struct rsnd_priv *priv);
> +void rsnd_src_suspend(struct rsnd_priv *priv);
> +void rsnd_src_resume(struct rsnd_priv *priv);
> +void rsnd_ctu_suspend(struct rsnd_priv *priv);
> +void rsnd_ctu_resume(struct rsnd_priv *priv);
> +void rsnd_mix_suspend(struct rsnd_priv *priv);
> +void rsnd_mix_resume(struct rsnd_priv *priv);
> +void rsnd_dvc_suspend(struct rsnd_priv *priv);
> +void rsnd_dvc_resume(struct rsnd_priv *priv);
> +void rsnd_adg_suspend(struct rsnd_priv *priv);
> +void rsnd_adg_resume(struct rsnd_priv *priv);
> +void rsnd_dma_suspend(struct rsnd_priv *priv);
> +void rsnd_dma_resume(struct rsnd_priv *priv);

rsnd.h is categorizing definition for each IPs.
Please merge above into existing area.

Thank you for your help !!

Best regards
---
Kuninori Morimoto

