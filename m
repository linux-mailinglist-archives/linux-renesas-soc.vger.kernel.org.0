Return-Path: <linux-renesas-soc+bounces-34898-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WJjrKwWATmrJNwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34898-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 18:51:17 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF17728E54
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 18:51:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=Kaa1jvF0;
	dmarc=pass (policy=none) header.from=renesas.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34898-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34898-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E079C300A4D3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jul 2026 16:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C25C438031;
	Wed,  8 Jul 2026 16:46:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011066.outbound.protection.outlook.com [40.107.74.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7B943802C;
	Wed,  8 Jul 2026 16:46:07 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783529169; cv=fail; b=gPs5HJtPRyC8n+6/hcvHei05to9pPs42/lug2uZ2tX9L+dQyN4c5n76IuPSGF6l5SA/btfJsqa+EcIDqOjUNXIgajzHv+vu5nM4hAIyoZYA87jdG3pzjYAlthwWA5yU+V4PUz9kaJaTdbKJ0Ep0QZrGZO++9SpsqnPcZSbylXyE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783529169; c=relaxed/simple;
	bh=2/EFyUXpZ/3Neo02BAn2QK1npqyOZdvi/2H0ZMGfe8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LLqhMqhRPxcVryxeBvIZu3mIVbCF242QAATKAn0ZZDbU0++aODiN4wDiGvYKvg0AU9aixF63Rgrq18PRvONDGynz1CAGAaU+KWg/BI9FcCCaIO+5LaUgX9VVRAKDZ6d7OEv13AKlI7oDWuR8H798Z/qABjqaabcTkk3BghQDIl8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Kaa1jvF0; arc=fail smtp.client-ip=40.107.74.66
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TUpD+J6TD2nqwJb0YhbDuyxAgXomign5wZrAhibr+EYumdZySrUbGX/I5tfJtFEPezrYWAXbeZ8uYcLd8KB3zMqeqiaXOwS8AP8bmRWJAv4fW2AUR+wNrYx2zv3zMSd36RDVlp/h+gxZcLrHjiMRBb6YGgFp/M09jg9JIZ/Wx0o2hQf51xUv79h1c827qEhZ+gqPzbRSSlrPA583akB8Ocbe9VzXU6GSj/azG2+PfEeTF893twqAAZQn4rP03e0jxjhbBG+mKw7Q9q1deq3GNytBbXMBsP8KHJVBNTnzZeoP8vCmTCqPw4xudn5lYJFHRcSt4Sx39evkI2tILnWvzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KiY3IS3wny8UxwCTbz5a71itRgtuHpCMkTZtBG5c8pM=;
 b=GjU9IRyZS8nxIZgBkv9VOP88YtJyO5VCpR2J9xOWnpvf8U96q6UG8rRRCs6zImhBAa1Lfwrmyt8BFr53U4+Qsa+9pjYdG87SxR2qFf8D8AeZTn+pjGs12Srt0YJut2tIlYXdBTe93z/LdwQ80KCYVVBnzcsLPDpjwafW/51zoBt7CE/w7w6TJuAruY+jpYCkat1yMGj/Qn3KFsP0UEYXeJRlUVIBNaBOxy388tGincO5kupdnMwqThxoNE2mKMjqkkV/rXqYIkkHMlPYMsTu2C9T9czloA3wKCG2Q2hm44M/DxFHWpfZsItQ2ftiziu9WAT5pITwIdMh5dCS7U6Jog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KiY3IS3wny8UxwCTbz5a71itRgtuHpCMkTZtBG5c8pM=;
 b=Kaa1jvF03nqLSxd6Z12VdA3xrmnj82W+KZTPRt8jXUqZOHdlqAgUlTFWWIvwwDebsJavHgtoHrqswXh1wOu1hHuuaWUIsAUeJfWe1p35BJkaYH/xfMZLE5Ff8KN8arjxAXp+EH5jvSVCJmbgdfW0I4ZGaZgkneLaEFu+nc+w/Dc=
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by OS7PR01MB14587.jpnprd01.prod.outlook.com (2603:1096:604:38d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 16:46:04 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0181.008; Wed, 8 Jul 2026
 16:45:58 +0000
Date: Wed, 8 Jul 2026 18:45:40 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Biju <biju.das.au@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 07/16] dt-bindings: display: renesas,rzg2l-du: Document
 RZ/G3L SoC
Message-ID: <ak5-tIYnLmHps4M4@tom-desktop>
References: <20260704093433.273672-1-biju.das.jz@bp.renesas.com>
 <20260704093433.273672-8-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260704093433.273672-8-biju.das.jz@bp.renesas.com>
X-ClientProxiedBy: FRYP281CA0005.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::15)
 To TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|OS7PR01MB14587:EE_
X-MS-Office365-Filtering-Correlation-Id: 05eff522-a4ef-4b62-b756-08dedd1062c7
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|52116014|18002099003|38350700014|22082099003|4143699003|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	VYIyrrexNDeF2MgQpkZCcrgpRf2K1Etd2KpeXT61Aa4ceKy88C/g1eJSO4VllvdZM6Kk+KUuUq7EcHQFcpepgKk5tLFJ9He18WIXK1uZwQS7cW2IdfJ4gPzPPNPq/Gu3CdNpZu+zYWYflNJTnfkTGzAPZqkJ69lGZxJEQiQ01GVOZ2V0zkTIO9sHUZnAAioaFsv2SJiqttWVNe8wWUux8lipEjFrp8YPX9M+s36rfDSfaKUnFjlxsC7LhTNICm7Cy1s6YrmIxymbPpp07PO0eegIAx7zptsvaAA1AIP9vinXPQD0d4MtTrrzRnmuY0Vtfl7w4tshXX9CVIjyQ4PE9fGgFfbUuvlS7hLvIkFbuQ86Ya4nsox2XSSKiC9v6+FBErJHNpMQONoI6HGndE0yx0MJ3GfJ4mUkvJlVY7sjkssjrFrl9/ACV4zYrp8QaoYHV/LgHdTyMCM56u6HUX/Rjm2ozYGbJkUO12/ezZ6vnHGlE5w6ZCsY9LDVVWaV24+siLQgUgpVsASOZywPC9Kqglb9qSipPD8vZikODT1FXpWTv/9CE62VjDC8NxinVYgJwGPj9JWQyuwzKKioO01JSHE22mBBlm9VaOn0moW864fiZDvy8hWZ7g+LUe++dI9MrJxbYFXXydjhVbSCO5sCRpHrcdtx4vXrGXn2PvfMRM3NtfD4FS59GCJE9VaUrUBemrUP4ViZ773LD+DQpaRcmBTPs2kjGVlN+4Tanes8b3o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(52116014)(18002099003)(38350700014)(22082099003)(4143699003)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GdD1oMva/AjrGRudtODv6u+pjGYyi/lvsej72aTrNK1ixLlfpsckPQkCHoNN?=
 =?us-ascii?Q?nh4k7q/D4Jg/49Kao38z2HHKGEvaC53Xo49oHCtENPdaAd+OQ4ejJ8K5uawJ?=
 =?us-ascii?Q?HUlCV38TLEVnBouSNgF+W6iB25nCSL4Q7dJLf9Fe9Nn1HALgfdUpDC/26xBH?=
 =?us-ascii?Q?qfmn4ER20Sh+ZCWOyXuYkj1YuCNyWL5206ieAhhu9QFRzgCQFC5l+JF6Kd+A?=
 =?us-ascii?Q?FYDXq1JIvAKFW5mKkDQmu1/+R2xwSw+OBAfIPGinxySDZpj2RMBnPDmryqEU?=
 =?us-ascii?Q?A60WPLSPKfhp6HACYp1sMfhfu0oQQ90mr49Xb+sadNhb1uq94CIraYopT2dC?=
 =?us-ascii?Q?l2II74zevdGW66SQW5vyS4Wsa6kwoB4G476rw9dtKsheWnKa5eAmBPbfx5aT?=
 =?us-ascii?Q?suwWIB4Kr9Wq76GqmJB6WDEJCmHGhJgflY77Fwv3ZaU4eZJaHShxAE2lwt4Z?=
 =?us-ascii?Q?rBOZjZbxVY2a/ER3dbCMsFbt8brcUq7avwzV0TsCjJ11ceM55AOXl9Y1VKro?=
 =?us-ascii?Q?NNb/Vik4g/H/vfsmTKyLYrXCjZYwXAGiCe+36/Kgo0NurylosVBrsPKSMlpU?=
 =?us-ascii?Q?dugJ50ibOmIUrISxCt7A7GTfta1vQdXmShMlVrKqqCNwa2NXseo1PqQcTRJV?=
 =?us-ascii?Q?qI0hiLzlVu3jna9NWr+fNB7J+/3GyxhcYvqKpocOasSKrXy7Zo7pPoVysgFR?=
 =?us-ascii?Q?DPiz5XZj/rcPHFQ9xR0w0QkbkLrAe+cm9u9EeEwuKVF6fbhNX3SwTxzVol/l?=
 =?us-ascii?Q?rq40jAb66B20IxJP4jKRrxvPpX/SvcLgXeJ/eFaXNMRgMsjCd6v0XYyouQuO?=
 =?us-ascii?Q?66A2MOcmf7BfDiQohOFdMWM6/mwKVf7sQBNN9O18LqdZ5CoSPzBtNUTWnlK3?=
 =?us-ascii?Q?BQDSs6It5Vkne2wUsTDn58IXyVtDtU7iZeCZ269VxM3k5iSXhXNWd4L95SOY?=
 =?us-ascii?Q?9bbXhq61aUZFGY1a7m02TTYSUwZn5e8qrPPW5bEsOWCnm+cGfmm93mJqfmxP?=
 =?us-ascii?Q?+JIWyCG/ckpI4HuNYQmPPA6QlRd/BlISIflwWm4eDiMlT9e3Todxe19EQsYG?=
 =?us-ascii?Q?KHFVdXGMqjT1cSZ/aA2EkeL3cncAG0On2j0q/O4D1AfqLfiP1uFq1Exu7J8s?=
 =?us-ascii?Q?IqBYrrnCttQ8yAycVh10JKW0XRAb1cZjixLmPJPftLGtlJXoGtgG0tc1siVy?=
 =?us-ascii?Q?+QAg352RikLU7EA4msQCDwCC6l/959NJSEvX16pyAnRgI3AtnEcQW3FPuMPF?=
 =?us-ascii?Q?m74gdn/YV7qy+FHEyBygOnsDVQ7+OajfUTBmhbn4Lp0NmybHTVxQovKqwFZO?=
 =?us-ascii?Q?T17ZDm1Hr6k4loi5JfEUnnApDIoTkZFxTUsqOCiHtjiLV2lXzHcg1ekw2H/3?=
 =?us-ascii?Q?yqyyz6XTqFk4vKbEzAsxHXeghwbATk/ykfwc2b4+nDu8hErZCR/EP52KRYnE?=
 =?us-ascii?Q?nyzf6KvQSEjoPeSzc2s4b4kJZea0pzTfe6+DtB7VejBcKsNUKPA1qIXBGzQJ?=
 =?us-ascii?Q?1N1knl5vQLbpn5kzi5wE07Q/7zRTEDHZnJoZa9VwdROt0OIpjWDT8NrFcRUl?=
 =?us-ascii?Q?mRpJYZNm7i1vBjpGdKHwTDzh88vmogaLpBkF3meIgrFS/iihNRtNOzaDPGh7?=
 =?us-ascii?Q?0b0VFJuIX6UsNfO3H8FR0fPiIMo31AcHYAB3p/GWzJvnrzHN22ROUbAAKwE9?=
 =?us-ascii?Q?t0eluBayYfyv05cw6wvRsKHvD6f3BUc95MAAbAxoYslecfzZFllO9yKGOn2/?=
 =?us-ascii?Q?JuvrKGqSa4TTbzQ6vVPoH+sAJdKqvxnXXl+IuNBLOFGQRcJ+vLLb?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05eff522-a4ef-4b62-b756-08dedd1062c7
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 16:45:58.3264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3hkSfPMfhyzzAxo7wUHfgLut1LUKM2F9Tlb5gyFtXBGRH081jpwc3kTekK2jHzpKQplEXc9MD1/q6dg5y9xunnCnHo2HulyTcE3+UjFaHoDbOqDsCCsqa50YM/gHE71B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14587
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34898-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:biju.das.au@gmail.com,m:biju.das.jz@bp.renesas.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:laurent.pinchart+renesas@ideasonboard.com,m:dri-devel@lists.freedesktop.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:laurent.pinchart@ideasonboard.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,glider.be,ideasonboard.com,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,renesas.com:email,bp.renesas.com:from_mime,bp.renesas.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1AF17728E54

Hi Biju,
Thanks for your patch.

On Sat, Jul 04, 2026 at 10:34:17AM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> The DU block on the RZ/G3L SoC is identical to the one found on the RZ/G2L
> SoC. However, it supports the DSI, DPI, and LVDS interfaces, while the
> RZ/G2L supports only the DSI and DPI interfaces.
> 
> Due to this difference, a SoC-specific compatible string,
> 'renesas,r9a08g046-du', is added for the RZ/G3L SoC.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../bindings/display/renesas,rzg2l-du.yaml    | 27 +++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> index 7c84a9ecc7a7..65368649fe77 100644
> --- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> +++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> @@ -20,6 +20,7 @@ properties:
>        - enum:
>            - renesas,r9a07g043u-du # RZ/G2UL
>            - renesas,r9a07g044-du # RZ/G2{L,LC}
> +          - renesas,r9a08g046-du # RZ/G3L
>            - renesas,r9a09g057-du # RZ/V2H(P)
>            - renesas,r9a09g077-du # RZ/T2H
>        - items:
> @@ -65,7 +66,7 @@ properties:
>        model-dependent. Each port shall have a single endpoint.
>  
>      patternProperties:
> -      "^port@[0-1]$":
> +      "^port@[0-2]$":
>          $ref: /schemas/graph.yaml#/properties/port
>          unevaluatedProperties: false
>  
> @@ -88,7 +89,6 @@ required:
>    - clocks
>    - clock-names
>    - power-domains
> -  - ports
>    - renesas,vsps
>  
>  additionalProperties: false
> @@ -108,6 +108,7 @@ allOf:
>              port@0:
>                description: DPI
>              port@1: false
> +            port@2: false
>  
>            required:
>              - port@0
> @@ -124,10 +125,31 @@ allOf:
>                description: DSI
>              port@1:
>                description: DPI
> +            port@2: false
>  
>            required:
>              - port@0
>              - port@1
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a08g046-du
> +    then:
> +      properties:
> +        port:
> +          properties:
> +            endpoint@0:
> +              description: DSI
> +            endpoint@1:
> +              description: DPI
> +            endpoint@2:
> +              description: LVDS

I'm seeing you are using ports + port@{0,1,2} in driver and soc .dtsi
so I think here we will need to have ports + port@{0,1,2} aswell.

Kind Regards,
Tommaso

> +
> +          required:
> +            - port@0
> +            - port@1
> +            - port@2
>    - if:
>        properties:
>          compatible:
> @@ -140,6 +162,7 @@ allOf:
>              port@0:
>                description: DSI
>              port@1: false
> +            port@2: false
>  
>            required:
>              - port@0
> -- 
> 2.43.0
> 

