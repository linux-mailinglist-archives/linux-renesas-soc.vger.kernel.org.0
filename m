Return-Path: <linux-renesas-soc+bounces-31477-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOYeF7wE6Gl2EQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31477-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 01:14:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D23D3440767
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 01:14:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A3E7230547DE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 23:13:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B4D53806AD;
	Tue, 21 Apr 2026 23:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ZdxvnqMo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010062.outbound.protection.outlook.com [52.101.228.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC54E259CB9;
	Tue, 21 Apr 2026 23:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776813184; cv=fail; b=l8sVFHY9yAMqmFfOq0nOzzcnJ7PlTbpFvlIhJKMdsb9JCw1RN/pltp5To8t3tO9fsLcq+Cpf0okCkQdfrQ/Evpmx0So6dIiisPbo43eghfRLZir7+JZtAHsyqTwNO3xwlos6MrcyTDoJ4X1vBO1AOFsGDiJoG9GHTc3tRi27W3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776813184; c=relaxed/simple;
	bh=V7hp7UwqiI/hyBBN2GjfaSNikwQEyObme1gIUVB3O6w=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=MrOlHeYzpoOTzThhw80NFdN0q/Q1dJgCrmdyhsC+vxL59iwWA0MBRYy/vwyblxQzjMR1eK/lvD8vBXdAQgNN59DlgVreCm2al27rda0+u3qQw1eH0cuwv5AD0ibNo0HDLhDAmRdjDlEmNvaX4wBGKkDctnsXx5lc4gaM/RcJSLg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ZdxvnqMo; arc=fail smtp.client-ip=52.101.228.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CMEO8EVVjS93wvuO7T+e9NVBKjsZoKBvAX3oqzmM8hw87GUaCKE4AnlOsh0AifoqqwzoQfJ2h71mcUi2JKTkOYzPkN09zQ39D3qUf9Irmk+aKwvD8+7Bc9YVl43Jy2Bme+wflE88lv/GSjAq7O/pVe6o9iNI8TaStWL49D5Rwt75+KN2Omvik/tS3Oos2yUBc35JljHaUwFEqi/7DdS7Fx5Wjq6nMgO17ds7AuK5Kpv0g6SFrRslCRYO6aIEhmi13qbqdyaYI/D8vUJYt5wAvwag0eUqUpzlSXwZkIEiJ7K50DEdbSGSVlymsr4/3Lk68S2ErJWFJgeYMtD8HUHxZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KKPxupuQ1Q3wQpPc7KNifpb4yvbOYaNn+d20QrYaLy0=;
 b=qexHZXkG5aF+JMfpEZc8yX43nqbg6c8KJvU8OA4+70F5INEGZWg9bkDWIufkYPEuqxlCdGO4RoG3gEETZOJFkJANCGYTOmm0Xe6d62EsMe2h7OJ0fwrW1csfOiIPeDrJh6891Ocm6k74OtNhqAq9Bdg5YasUAhRZ2jdCqJ3HNYkiwxF6EzWuH9zjFl1duF8jYeyLeY52A1BgSEg4N2B+LLHuOLZEPVkO+IqIlxLTo1fDQ/ADDNtZzHH7xbTFqPru4I5JLxVNMJa82A1UggqVVmCJ4z7N7oKQUQ/k9HMY/RTDpx2zHrELmJdX+CcbFKHet9sFXqM7ELythZ4SrzrQNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KKPxupuQ1Q3wQpPc7KNifpb4yvbOYaNn+d20QrYaLy0=;
 b=ZdxvnqMoyyuuish3YP6qANMpEDcmt7Y2Ok5O1aasFjFZgHXdr67Fvq2FRpQcoJ8YpPJKDJ5jPaTnpKFsMSZSphPrVuKJe9hK/aQAdcrYD6aJxkmD1fnZ6MT8XeQdKXo2ecjoVRnTscgTKccpGQzBz3r6ahFrdq9XRxHIopAW+v4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY3PR01MB11890.jpnprd01.prod.outlook.com (2603:1096:400:406::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.18; Tue, 21 Apr
 2026 23:12:58 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9846.016; Tue, 21 Apr 2026
 23:12:58 +0000
Message-ID: <87mryvkivh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: John Madieu <john.madieu@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: Re: [PATCH v5 13/14] ASoC: rsnd: Support unprefixed DT node names for RZ/G3E
In-Reply-To: <20260417225249.mvi7sygew77wf374@labcsmart-sqy>
References: <20260415124731.3684773-1-john.madieu.xa@bp.renesas.com>
	<20260415124731.3684773-14-john.madieu.xa@bp.renesas.com>
	<87h5paz1w6.wl-kuninori.morimoto.gx@renesas.com>
	<20260417225249.mvi7sygew77wf374@labcsmart-sqy>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 21 Apr 2026 23:12:57 +0000
X-ClientProxiedBy: OS0PR01CA0073.jpnprd01.prod.outlook.com
 (2603:1096:604:99::20) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY3PR01MB11890:EE_
X-MS-Office365-Filtering-Correlation-Id: 026dc71c-934c-4963-2d90-08de9ffb86b2
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	tU2wHiBTL39vW5vaGRk1wKEzZakU7KmKvbivJHA5JMfdanfaWgDwxy/DRYUm8AsKJmnBrTRAJcxEwreoX7bz7jYP8YYTMiteGspxSRznDVx20jLoM657aKyMsVbUPWWauCz6VyD0fnc3HkbWATzNPC8iFiliD2t0yNhjlAZUMZDc4xAeFJN4SZHsXv79+GKjz8IeJlwukT3NrKZlGq9jFi6e9iPkGTySMXIc6kSnNaMK+IPj3cSMlGArBv9r96QiAZSctu4sD0iK7CDkp5/qKNfieq+kox7jEgDOWYXuy/ECin3GzV5x5qw8rKtJhJO3Fx+8sdLGcpXWLuVfmD0+XDIUdR29u95R3AuQ1n7n/yD5V9AavaVBUdyc98oPhaugPgUhEVbs5UU+0TxtvglxrpSpydLW3ny0WNOabXamAVp7I/VHmS8yx2vyH2EPcv1ClB9tiHafrGxbR1Cv6NNJlITF2JUvAAKzSfdLE1vWmILuawAM56SgIu9ZIL+r31NNkti+sau7/Q8o73x1TELM8Bza8oKZIYiRiAfVvWRuuEtm6Rrndg2/tp91BBa47fC1uhGu+cCWmxqvU1cqWl1aZXUybCt59EDMAsVDSDXBZdJ+LTjH6rEypZrmG4E+mB3SzG4mmf7fTLiIOeKtW75GxBRXz4bZqEX1gxfGu59tfNAS5kl+Dhn0947bdNiYphJh+GovEwI095TKlQ6toMt+FqBkgPZjZ3se+lq2uV1Dzgl4vmKiOF0Sq/AJ9iZk/qv8Qbj1nAn/m5VLKyGB3yTkGFxmKr1yfKMhwjTLpgCogJQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8i+80KChHy9mxrsc9uHXECkOXImOqSG3kFjlN+jCeNKg/C5Bn2tmX8ZCMVAD?=
 =?us-ascii?Q?hg1uZQRLqIx0guZwMl+BIgB/RAKMBW7ynRrwa2hZZUg5oERTwwp2Z2FrsjoU?=
 =?us-ascii?Q?96r1Wr+kdnFNshckIFCbt5zWNglDoMx1o6y2QtRH5Af6nrj8hOe3nHs+6DJp?=
 =?us-ascii?Q?vdeoNl+c/Q+XgIgrFBvjiTVI649bqHIUlJPicnEABBPJSHuz74TJdIgGyl8r?=
 =?us-ascii?Q?Dzw9tP6bPMRSKpUIMzuHdNSm7WNLpRaTtm8XSDDKMs9QeUaKi9l5nodcC7R1?=
 =?us-ascii?Q?ljPT5oigtveUMTGG65369N6PT/gSkOXIpYHz0R2vOR30pojH/zVKfm864LAG?=
 =?us-ascii?Q?kHrAfWaE3XLAirWoFgCE7wMF+a9g+pduIvKS5OpJqQrxsOtFy9WcTFaQeDFH?=
 =?us-ascii?Q?7wJmft0FNu6eIon+si/1lOVplvmqCZxfC7l/APlAr3FjcNPNRPPDlJ67P/+J?=
 =?us-ascii?Q?akJqYVLGOsTvqbzNNHtAtRZAZObOHaNLFlntt6n9TG94DgxD0Z2S3D+XkN+k?=
 =?us-ascii?Q?WfFuUX+drfOfq/ITuEHRqPHgn3iEz8jHnoM8QHyMJXt2dx6pmZIuGefdi/sc?=
 =?us-ascii?Q?t6E0vXzDriUY39Ii/I4yiLel6UH2YdvWqjWURvM++ZP+/ggj8+10a/6WZyxV?=
 =?us-ascii?Q?Lw6+S4+QlkjuvkEcuZ90+S7yC1zxnMUta/FT++IehjQLRLhVy4tcRt7xaHQl?=
 =?us-ascii?Q?2RMWUSsWu4SFZdg8C/NGPe6X/+08tuZJiiGgGQDMkAVT089UmyyAwOyrEvqy?=
 =?us-ascii?Q?1FsbrQYGymqWZzqKD+VsoIoNHWQgLPJBkmcFzllcFOSxJ9YqzRB47u0Ho8Rr?=
 =?us-ascii?Q?w2B2xNMQGDAAj/CxDKuem82DPKkk6ZoSL1qexBtUM2MWBykQ1ofhgbnTzVpj?=
 =?us-ascii?Q?Dozu4uekvGnouiM3NlxQzdE8uP34Kxmc/aKJ0k6Pz6ZoYZ4K8UO5JBizkh7C?=
 =?us-ascii?Q?plbfTYQMo3/s0PHy4Lr2WbjbzJrrUB/ABrktqSduaWgtS0NhbKyxQ3N9tk/+?=
 =?us-ascii?Q?uWhO8dWYqWVFPTjH8WBz3+xXGxPWNzqpZh/bvFMuDOtdok42sPcl7jiyTSTx?=
 =?us-ascii?Q?piZ4JSVQqx820zMPPIp/B6Q/CL2+jrFpaKXWyp+CgPBUgKhIWrSc1Id0y1L+?=
 =?us-ascii?Q?eAg/l5JDsi7dRa7yw29PQNzz6uX2dt9GlsoivzSH+5e09PhedNwvxYSS/aGP?=
 =?us-ascii?Q?ey5Zrum4UYhQkAs3WYv88D3ezuj8rX18Rkogi90N9boLA/GivMQhrlXgMN8X?=
 =?us-ascii?Q?TOrlnaAX5Nr4Fw7xxT4RgiDk2TH3jN8IC/fXhbdF7eaMZfD7DR0d3OjRF0Pg?=
 =?us-ascii?Q?52RB7EIWdCBKrJvEdhfMcXywsv65udgbo7ORT1n77n5PSaJ3Wpi8YxJ9o4E8?=
 =?us-ascii?Q?XUzj1eHy6ZhRLqWRHKy5Tyh0mQtAwWUMJqztNT0WOX5tIZjVuLJhMIwFVrTu?=
 =?us-ascii?Q?Cf1KUcd8Sr+jH2DwmA95uhM///jTZSPUlWgUHlSJsv0ZjOrurFPc4ZP9deqx?=
 =?us-ascii?Q?KfKc9JD/SUtz4H3HFP6Msp4bF4YPEIZ/LuQ5zORv9cvJcIjr2cI1qgf0fiFL?=
 =?us-ascii?Q?CVQvz6D+O8aiVSYm1LDsSTA4wcZ6H2fvQE37otWuESqDPIDUGArYLNatoEL/?=
 =?us-ascii?Q?InwdY5oG97jWdBmiWRkvqX1r00LoEa7ho1VUOV+hD1JZKV5jUZgGXKBuvPTg?=
 =?us-ascii?Q?+ldpvh/m0KCv8nzacabdeEj47l7smzgw9oRhDWlHdxJ3cwaCUP3BgQ7bnrSJ?=
 =?us-ascii?Q?kqTwA9Ru9JK851WJ+q9j8r/J0wPU6UtcOsbNHffbnw4eYl6veCiA?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 026dc71c-934c-4963-2d90-08de9ffb86b2
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 23:12:58.1506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J16RT1EVNUSf4Bukw9IXEpibYTje2Ux8662Zyc9Vbe4Ppg+wwsUf1cnFP7/cIESw9LaExaoxXhFezyjcgZHqzRZdWXJjOpL9P6li93yxSBcce5AUT2/JRKPbxkrOMqSk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11890
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31477-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,glider.be,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D23D3440767
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


Hi John

> I agree that having the "try prefixed, fall back to unprefixed" rule
> spelled out at multiple call sites is a consistency problem, and I'll
> fix that in v6.
(snip)
> This way the "rcar_sound," prefix convention lives in exactly one
> place, and each call site keeps its natural operation (fetch vs.
> compare) without redundant lookups.
> 
> Does this work for you, or would you still prefer the node-based
> getter?

Yeah, something like that

Thank you for your help !!

Best regards
---
Kuninori Morimoto

