Return-Path: <linux-renesas-soc+bounces-30809-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEqyI9gVz2lQswYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30809-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 03:20:24 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2668938FF83
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 03:20:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A582830B82DC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 01:18:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13A41267AF2;
	Fri,  3 Apr 2026 01:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="VqgaL2F9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011002.outbound.protection.outlook.com [52.101.125.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E8C20B810;
	Fri,  3 Apr 2026 01:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775179093; cv=fail; b=IFL0shm/32BCj+VMYxtLn+RlzRF2REUm70C/JWFLMhlw+z1921mI6+QxYxMNc0TiV0zAwgCh2uekrReTcmByV2gILViCIDMKx4j2lww978bWrr5hiRfmoDqU8IS9tvW8eRHYNGNwFKzL49ud6DsDSj9eK1fsSk/TvIIxImLEBxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775179093; c=relaxed/simple;
	bh=2IFTwjE6GE1S9s6KB2hMHrKfsHOxCFS6EJCvn/zInOc=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=fKQEkfhaN/Dl/kosw28p0QXmhdxjpyS2klNob83eG5qJsFX4Roim/uBnmEPV2gZFIj5PooYMBhMIQN6EPR5Vq0EV21vKAUWW8zXgZ8qBS8xH+nvGjAs/dT126hytB8iKZBc8iV6PV5mkwA9Ohmp26GSO24UAosxRRGWV2m0Skek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=VqgaL2F9; arc=fail smtp.client-ip=52.101.125.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e+wZND8Sz2qQDdFl7hyL98oH93hVkUymOsT/J9FVlT1+rMAZXx0qSmjcaELQb5DsonseryRY8Iuu7czoeoKog/iJKRefhnD4uAuZYstABU5U9DyL20wKeB6C/tRPs5DZ2Kv7fSYwBm9f1A8nDSx/nRVeONlhxVydqlIXnUCkJ71i1LGNArwwfpw7QF6IpHI5HYDkbJXKr9Iy8BqbL/R7jmPhUZQbu3nH3is/DiadzG9FKz2wc26zUURvzglMftys1hJ8y59GGJCR+x7guj3pg3XqyIE+nUZyBIQ88skSYaoVGAjL/QFp1WGIm+6RwXvpsEbl77fGxCnSjPQ0aLmyWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xiWRXHc0VcE/CYGwWPQbWweFTI/GJzzPVCrlNkl/YqE=;
 b=C7T8x4zN1ShE0ztihyP1drgEzzCo2kndhghRCpYOAhqkPRGSSbc4wSb6Qv+F0zXqVdv9R+lT4jYRcqv8VETj7mm2r/H2Lt2oa0Rs8kIytT0mF86S8Vru1S/2JXRpS+lhSw/uyuM3XscVB50la1Se7gPBSfnluKTdXX+aYYE1NukxMUD3m6krl2dDozPpDYGEmJryYh+G98h2FYuyTsSIumgEv6c3ViIjZ9CpEy3WZnpEu+OgJrdK0yjSZOzj10BYAl4G5RdqogIvxmv29fE/soJwbJRlhutc3/JyZxru88RsZLwiv8li8HMfR/keERFVbOhFfS6lbNQAF+UhuVQXHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xiWRXHc0VcE/CYGwWPQbWweFTI/GJzzPVCrlNkl/YqE=;
 b=VqgaL2F9CBaJfiIRjLm8Pentk9ZchKZZrtR83jaSMebLqV7fKmNczIvTfKiWX7csI3Y3Xc0p5eOBaiEyeHo4bhENeiy7yPNh7UgDlR+VksBH+d5mgkEQFQ9uFYTqRZ8AfprpR5H/POay0IKlkvYXbSsj1OK2/+rJryCxwuw9aUw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS3PR01MB9316.jpnprd01.prod.outlook.com (2603:1096:604:1cf::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Fri, 3 Apr
 2026 01:18:08 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9769.017; Fri, 3 Apr 2026
 01:18:08 +0000
Message-ID: <87jyuog7u9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: John Madieu <john.madieu.xa@bp.renesas.com>,
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
Subject: Re: [PATCh v3 07/14] ASoC: rsnd: ssui: Add RZ/G3E SSIU BUSIF support
In-Reply-To: <a457c427-95bf-43be-84db-02144fcc2bd6@sirena.org.uk>
References: <20260402162436.12059-1-john.madieu.xa@bp.renesas.com>
	<20260402162436.12059-8-john.madieu.xa@bp.renesas.com>
	<a457c427-95bf-43be-84db-02144fcc2bd6@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 3 Apr 2026 01:18:07 +0000
X-ClientProxiedBy: OS7PR01CA0095.jpnprd01.prod.outlook.com
 (2603:1096:604:256::15) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS3PR01MB9316:EE_
X-MS-Office365-Filtering-Correlation-Id: 50204d8e-3e2f-4839-52ce-08de911edd27
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|7416014|22082099003|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	xHbdtamlCTg3o5lIfnfzQFPZprbBPnNGfi7Hn6T2KQWkAePH2Bwhn7F0vwns3O6nXBLHQxBT+XUaoVLcQpgeVWe8VdwjYDNofL9Xxmb7+AaYfYJlsdMn0e3jnjXFKb9+JX3mxx3WmMPzjob7t4bdfnH+lraGO0I0neeS8/83IXxBhHDTq/3PT2zQMMM5oCMyhNPGSKRaI266MX9ycRIWHql4A/mqBi4n2hnMi5k4jZcb/psTMC+y7F1LY/slGV8Dl5atcPOjRMjvrqpaUSgnYlAw+fPMtCM54K1sEthRA+pF7Kp0Tnyt6joxWRU5BNwdpqJXmMCBMejLNKIf0tG5mw3YMClEynBx+c1pQQflQLdqVnfPfkil3y3VN7jeak5cpvw+2ZouZe+M6Ha6hXKhBEIr6rSahk42j7H+y0LHgH5nSaUGeyyyYDCKQ8d1ZzDNH1wHTo4ZIA5CtPDpaWNlqs4FMB/5RAdmy3Ty0kW5Cxzt8shOulqdLImY4mtkBo6QkWHmvX+0BVgCXa24qbTbZtrSUXess/zL5AlV5iGqyMg+sqyz1NuqvF/4v+QrfcFdH0pA0epDPVUCCy0Z/I5Bw3EITuJLmLce6JkPLp0pO5DAsC3VgFstzsHfuUcz2o2nU9S0Z7vAdKmmbQ549cQDyN5V8/3CEZxHFtVwg82Qa98AdCgZuoqDWD6P9SJ6gQ9kNygrU7TlPJx+ZDoYgLM1yMkb8DMqP/y3oaVHFeNvnRnPFIVQwLM3/mYtJrkRswDFrox8LeI1KOEFhC6u8IQSshZ6Fik20lu9W4Xq5MJ70Qo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(7416014)(22082099003)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BJ4wXjYdodxjiihLVgwkUGwlHDsdK6PwIsgJovBaTdd6s/UEx3PZJq4E/LaV?=
 =?us-ascii?Q?IJ1nlbNycpjGAE259d28czYrrd1TcfR9f5IVd+U7NxFSYlyHmGK0C0cPXhgT?=
 =?us-ascii?Q?y3tDYZfgeLD+ielzsAqQaKnLjp8LdS1ax955ULxgvU35N6Uydgam0XTPUj41?=
 =?us-ascii?Q?EVJUpPDx/alU9NLhujy22NjIAlufHaqCpgNgANUG5M1wYwBfRA6EQJFmK8kq?=
 =?us-ascii?Q?mKeXTGmbhoNN7vECExjgE0zwFphmp1abFMkOYwTOMvQOhug2xdD6tJSOMhi7?=
 =?us-ascii?Q?GEGhCV8+BZ3VbfzuJunSw2uI2gF7+dUGuy607jabFMfGoga/uykJrSX+A8BN?=
 =?us-ascii?Q?bp+u+GVbYfjHW+E7A7L4WMHk81wTj4/9RnrGrPmjyDRcee34uRD5SYBeDwBa?=
 =?us-ascii?Q?1Gs5oT76DZGZglAsrN3Iz9cRLuBFxibG4SpneOOGRnxtyq8wQpvS2GQNCor3?=
 =?us-ascii?Q?OYbjPPq5geL4eBTuFNmVY4RxLH8eCukI4dRSfTksbr+nSBk8yO8Pyih8/04J?=
 =?us-ascii?Q?K51mokOCHVBVFLbJMwcMcLA4vF5idjIy293ewwiKzVjbdcE3cbm/H//gOASG?=
 =?us-ascii?Q?y8u+gC601B4q5boz7BekVgDRwrlpXrPUvqLJN3qmgJit33YZoOiCgcyB67ka?=
 =?us-ascii?Q?Rd7TMlWyH8+RLDRvNSFHqRfpxifgdCmoE6UH4VvkbsP5N63kfDskvDGBFtPl?=
 =?us-ascii?Q?TbtgMvDN1garqumhJjjfpoUnlMJzXOgVtErISqZwI9lg/F328lgoav0jdjhG?=
 =?us-ascii?Q?FRvIniZVDWC3Ji4rbys2RqZJLTesmrGu4oiWzsn+btrWnrx97jt6hISEDfN2?=
 =?us-ascii?Q?u4uE3BBb5a565yrj48zGgV/8DrJ/tKvaA5FDfI0/Z6LM3pmPFshz/JT0EAkL?=
 =?us-ascii?Q?W/B8+5FYcEzoIABdffSVNchY4IYXwK4+D8B6M9Iuybw1aFlWOQy0y8hycwRd?=
 =?us-ascii?Q?VUTDgk6GcPSSxYkhV1ov07FSjpfeNXkTStoHyqYpF1hOyCqNooFJHoPlk6CA?=
 =?us-ascii?Q?VXXTS8CfvJFubz05K6zBVW/YPEeXBnH8KUBh+jfiEGpOEMTJnYgHfiaStnL1?=
 =?us-ascii?Q?yWDvVOv0Lj8IVjKWFKrPYP0vQKk1WKy8ncsBEWFhKpktaRL5eNE2h8JHJRBc?=
 =?us-ascii?Q?WXcGsbISeW31YOPbFobr8Z5QHqeyz3JIyh1V88Gm/bpdzUn+uyxvGlF8zVGJ?=
 =?us-ascii?Q?oJjKnuSzf932xvL9coO461XSxn94pODMY6p5FI6FciL9CQ86tx5MNiQRLthX?=
 =?us-ascii?Q?5GK96UIT0DDzqBLlF694B3xKTUY8mAcuCu1PSFn6m/DYLOEtyeIx2zZwu77G?=
 =?us-ascii?Q?yu3dNuv6D7PjHI7CXOguRfETx9cUxgQJw/+nDfBpu856enFJgjklKaDGshAx?=
 =?us-ascii?Q?+kDB7lqvRASuNEpGKxhyxbe/aOPDImDN09mbb+L1MHFki9PM9bUHIZJVtP2q?=
 =?us-ascii?Q?4Ygfnii7wYtsRGeli/1BMrQrfVGBtvmH92+2sBssG3TFOgTU/rGTk/qP8uTB?=
 =?us-ascii?Q?dFQMZtICDOCscMQW9+H5fGXwPZMZSgFPMLJ6mzC9Xj73z4KhVJM5WhxPxRx+?=
 =?us-ascii?Q?Jhf3k+el99tuOz/2aoHuaM7FApsJUc6ytEjZZspRhwg2pbeU6yLJ7HNbUqWg?=
 =?us-ascii?Q?5ePiqSOHllqh53OIBNc1Esw1jPq+00izz24lFMl8E6n9cf0XoeNkZpwetIaB?=
 =?us-ascii?Q?lWZfvrMZ/UX7GNBUOEVQUJraSYXGYgOTuTPcToZQg7J7un8Kiuy14PNzAKNH?=
 =?us-ascii?Q?t0JWJ1NrwbYBN1MRh4rmdU1jM8cPy0lb4R7IVOEAcKSgO0hCmGE4?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50204d8e-3e2f-4839-52ce-08de911edd27
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 01:18:08.0216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8lAF/r3aZDevnSRZnaXN92hQnekzHHOllYLlDygpCopkfyUZct+IKvbe7jqm55uRHxsdDj8Hy4ILJjhhMYcJkLjYxqctBX21ZCnMMfW546TD6FD/5jqBE+zUKBWF8jwt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9316
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30809-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,gmail.com,glider.be,kernel.org,perex.cz,suse.com,pengutronix.de,tuxon.dev,vger.kernel.org];
	DKIM_TRACE(0.00)[renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:dkim,renesas.com:mid]
X-Rspamd-Queue-Id: 2668938FF83
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


Hi Mark

Thank you for your review

> > @@ -160,7 +161,8 @@ static int rsnd_ssiu_init(struct rsnd_mod *mod,
> >  	/*
> >  	 * SSI_MODE0
> >  	 */
> > -	rsnd_mod_bset(mod, SSI_MODE0, (1 << id), !use_busif << id);
> > +	if (!rsnd_is_rzg3e(priv))
> > +		rsnd_mod_bset(mod, SSI_MODE0, (1 << id), !use_busif << id);
> 
> Perhaps should be a capability flag like the changelog said?

Have or not have registers are depending on the each SoC, and (probably)
there's no regularity to it.
And SoC special handling is needed not only for the register settings.

There is no clear rule on this driver for now.
Handling it by flag is one the idea, but rsnd_is_xxx() is enough for now.
Because it is easy to find SoC specific handling part by "grep rsnd_is_"

Thank you for your help !!

Best regards
---
Kuninori Morimoto

