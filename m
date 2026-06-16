Return-Path: <linux-renesas-soc+bounces-34085-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id elsGEDBjMWqAiQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34085-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2026 16:52:32 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AF3690AD2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2026 16:52:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=O33cVl8n;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34085-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34085-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 594CC3002E17
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2026 14:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 421413BED32;
	Tue, 16 Jun 2026 14:49:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010009.outbound.protection.outlook.com [52.101.229.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8E333688D;
	Tue, 16 Jun 2026 14:49:38 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781621381; cv=fail; b=ij2227rd0ZtWoYb8xv8/97I9jFCzKK/61rNouhUFxr1O31irP8L94e3CX1lxwY4SWZNsC2wtVSBku6XMWaBpxicDDDQ2e88ATlIoex6oDilPIYHnSgztK0NvG7iiPnthnvPvUU+LcsBpR4igQhlSZrybZ9Klausg7tYoYZuwyxc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781621381; c=relaxed/simple;
	bh=cwF3OdpebaSKMnbPFnfEWv/rQaDshCXXpO3QuYhZE6g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MWRoI7smrjhjFxWcj6FUNkouAsuf4pILZRLSCO7wMNdfDSLfGry+Fa1O7gJVG2wyx2xh8ycwzzbu8z7rkLHUOa5GNTdjZpJLoTC3wo2YxWEYA5f/M8Vylv0NO2R4+V2QdGQPY6p/tCjfwpIuMKoKmzJ5PkTY2wolpJOJJbE1UmI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=O33cVl8n; arc=fail smtp.client-ip=52.101.229.9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qcpugy6eVeELyzK7697TMMJb8JzC7LvlrEYazH64zbwaOhk2vN2KUwluLuDhvzm8Heg1gQVrGkhnI/B8hVQ+TbjKnly7pvFjw/5D09tv058tqIPvAK55/MIftavv3wrugg75y55Vvt8oq0+frmCayIT8uuoV/mWFDX5YhbK+VEaXKdowq0Ay7gdmA8MSqo7NLUwEMHUEtw6VNxqwPxf4sNMDYpNRZ+jwgGjvn/a4czoWLaQypdH9lHsfhkHvgV6SgPNtSSTms92v22B6Yr/DdZoU4GvsbJE9p2fvXmNC3de3prLypPBWm258DETn1W3uMJwKwxhDuWfVVUFyiZtTCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OtiqzfwbEZKBMLJL7bAdtT9i6XXPW4C+f38FbaQ+PJ8=;
 b=YUVax9zDT9Q9/iRKj0gdIofy+CzB9NnbMFT2AXoMUuvUe4uv0FAVGvQmpkvNavw7UguCqlRkyzNQGrly8WcQ+umx1bHntk4lHcf2wu251DA+FiYSz/Azvgcchw8fPQHag+d8r6SsEMQL09I1t4u4XQPi+KN7xpm6adEFSnDofNUzTJxgWfmXucBDGTmQV+oCOg2GaM46k51GnkoS89qrZKFvQYgVXYg+JuDRfjMn4rshEWKsqJqaSehKpeXeUPMOe3OhrtVb+D63sqiMa2wS7trMV3BiQCCHEkBLW4c70W7G6a4qIcChFWffQ7L0eI2hZpyWhpqdcggzobbE2gDBZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OtiqzfwbEZKBMLJL7bAdtT9i6XXPW4C+f38FbaQ+PJ8=;
 b=O33cVl8nd6sxz+KcQ7eYeElHTF18kVyRSmWGuBhA+UHwe0iZ0QkTm0g7746EuBBosbO22VSFqRv8KvqJWxdfl720b42XhS9w2PvocNux1VohMi5K10K6j8O6Oa7dq2jWSULfEV0TiI5WAld+qGwSRKznZfKr/rpGI9c3gRvjHIY=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OSCPR01MB16044.jpnprd01.prod.outlook.com (2603:1096:604:3e5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 14:49:36 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 14:49:36 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com"
	<tiwai@suse.com>, "geert+renesas@glider.be" <geert+renesas@glider.be>,
	magnus.damm <magnus.damm@gmail.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "john.madieu@gmail.com"
	<john.madieu@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>
Subject: RE: [PATCH] ASoC: rsnd: adg: make rsnd_adg_clk_control() idempotent
Thread-Topic: [PATCH] ASoC: rsnd: adg: make rsnd_adg_clk_control() idempotent
Thread-Index: AQHc+PjrqkajRu0CfkuUK8HRbOHBfbY4ZYoAgAJMZtCABc/JgIAAwunw
Date: Tue, 16 Jun 2026 14:49:36 +0000
Message-ID:
 <TY6PR01MB1737795DA5F4671C634CCD766FFE52@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260610164704.2211321-1-john.madieu.xa@bp.renesas.com>
	<87ldcmovp0.wl-kuninori.morimoto.gx@renesas.com>
	<TY6PR01MB173775D8E134C9A90BB069334FF182@TY6PR01MB17377.jpnprd01.prod.outlook.com>
 <87pl1rmci8.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87pl1rmci8.wl-kuninori.morimoto.gx@renesas.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|OSCPR01MB16044:EE_
x-ms-office365-filtering-correlation-id: e0b4b2ab-423f-4ee0-cdef-08decbb67c48
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|56012099006|11063799006|4143699003|38070700021|22082099003|18002099003;
x-microsoft-antispam-message-info:
 Ht8OirAmU5/8LGHRWyfnuwO/ZQYo6jVff65U+4pAPWnDZARa3GMH2v5xMn4ZIQ5IrlgqLrL3U3anPdeLE+oh3sTNvE4obMblz+3GciqGJCSAZhXe3jzr7IA78W/ZvtdvAQJqp8v2TT+TDrIi03PxvIfdMYstOGwF1luX2yuHnOXSRUgc2VgxV4uXvyMapgF50K4J6LPthny5sJbBMO1Lqty1R4kBO4wq7uVQqmof0sOh6sQEvFPUfhlMVM0s52sG1+H2a3v4kmxUrIL9GvKkUJGpum9QDxuUGBj3Xs86Q6NAJLywFO+aUDyGsdWyeb8O2y1mF4Zj4cgWCX+HAalyD5iKZb23dJb8e4L3vGeJe4Sx8xcfrsjn0j5Vzm2j8RQqmz6gasDvRWl46h6Ryrl29LraJKkTwT59Q0YAr5fm2zBzwby1PPQheAUIAoNiu6YD21G6zKwepOjs4AK+ji2FAMaTfxbKELW7TuFqIGXz7jrfN7ZqdBmBNYe8GzIp4ou9e3+8Ma1cYywOhx4AKNcHaLZt08fCFs2zEWhlQcFOp/d+yhXQvz/qzDc/10rd2DNRyK96z8GrPUfxy6ZzfwcAdhKV6cnNnB0FvtYZ8OdqluSLIcYKOATprzXmIN8SqZbGh/pk/fSs3lSDTacKgJvByVagatNXXyiMJooYIogVwbT66bczHMlha8ce4GCuhJbWcLpXq4rGOraMn08eXOSUKPdLBEEkT9Kuh46dzbJu34pGD20E54/EPMILSjCtLv1A
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(56012099006)(11063799006)(4143699003)(38070700021)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Y3wL4ffSR62BOhRjUkg9984DFKQWuu6YbCERvL23gfa3tRqY6YYfNj1GGEor?=
 =?us-ascii?Q?pv5t/M9YZ4ET1VLAVYCrEvJ+mvo5NamaaFWiSQsmoNEMMJ/an98ACVgLLGTD?=
 =?us-ascii?Q?Q0g3vPJc7DLzeEbfofVkPag7MvdL5BuXfPI5HYiLI4P0ibzVWf4LqLJChd9c?=
 =?us-ascii?Q?9qM/nYSmB9rrv2q9MlF3m1A7iGwIi1P47yZgXcYGCqF3nZFCec0JcREM0YU7?=
 =?us-ascii?Q?xZE3ur/PfCYLFZf1Y+mUImr7LoNvx/mefb9zHDMmuC/JG3hMxxTTyHvufMkD?=
 =?us-ascii?Q?sRZHOAItQMvmvFZ9uKQ36U/3A1GtyjDNy1AmmacSHWVlSWMrVT2TIB1u15ap?=
 =?us-ascii?Q?xJ/yuhMf8dSu2V5F4IJmSaMPTr1kVpsvjolNlyl8cv2NwxPgISZr28KEjOLE?=
 =?us-ascii?Q?9A/gh9Xqb8J88iOK1zvJPommwRr1/oUv4e9L+XUJtSP2wI8odG5s2dgLRurw?=
 =?us-ascii?Q?k9rHQIZVIivjK5qcoLVyVFUklBsPo16fHKEk1/I/FDj+3EYzvx4yflUoaLOt?=
 =?us-ascii?Q?P+FaqKdr66/nEV6PGE+m1z/0h9gDzBeDtgZMDCQuciWPA1bJo00VW2zJ32Jb?=
 =?us-ascii?Q?vOtEC9GR9Rd3/dhx/jZCNa4PEuywtWsvy7aarSkbchub4WP3T0lhd/sDs3+R?=
 =?us-ascii?Q?MRtQQwo3EYUC0JpDC3RVcfs2AtEVZfh89rD4d5/LDevucODjauWcVnQ1xDP7?=
 =?us-ascii?Q?Tl4W4xgVUgDA/l98KEgYVg2HJCvabC80frTeL/aySbbVwMV38nhdGEdn86NY?=
 =?us-ascii?Q?TrAmiIHToSBtcsiOq1miBmdxkveXBuRfopSnAFTZI/JUSn1B4XEWDnds5iB1?=
 =?us-ascii?Q?iL0H8/gH2ZHo3tU7Es4BnSypLUKzBX6UXU9LR6+PrKyql/pStGBVrVyFxgMK?=
 =?us-ascii?Q?IBKbg918FPS15To82lbtA78C4Hf12jUYABbcDH9wZV3JtW0POqN44TETvpN5?=
 =?us-ascii?Q?F7xjCA1m6z/OZTyWzSJjZC3ePSsZbXNcjGrEZJD7658LFOXDqjb4h1oJI9ow?=
 =?us-ascii?Q?5vpR+2+RbeujnRO0DzBSyV3r0qU/x2TdF50dBw3Sb1Atw3SuIb4Luf2gSfI9?=
 =?us-ascii?Q?oQdY/+wb435rkAFPjW8IRMX5jh5jaHDVVXE47RGm5+Aetiecpqs1GGxdJ6Qu?=
 =?us-ascii?Q?IzPWG32cXS8eNrAMiboCeqiIqclpPj26TbNmmkBzwpIKOlEcVNBU38ECIDWr?=
 =?us-ascii?Q?huMsKT+kPN5Fr3nMEuG/zVAWKCGxOUm8RTaNMV6xqfH0DVCFFa/25Yh+Opdu?=
 =?us-ascii?Q?cOzgHywHd7BKJPS4DlZSm0e7/xXa8gEWNkoXrAhGz8wx/Un0jMyhS4xZCNih?=
 =?us-ascii?Q?9Ow2IeZaqUwSZpmyQaPUU/uD5aB5rWzV6ezjyS39AVW01a/f1yE5fu2LsaLJ?=
 =?us-ascii?Q?2VvY1OtVA+DO1mNcG4A/S0fufbspp0GVEAkSfIBCbOXWh8ebQwlk/loSVBjM?=
 =?us-ascii?Q?Q0VqSmLJnbu1YDQhICWQL7mo5phqP1k2kNtehzbpfRHrpdvu1/9jiP3msXTf?=
 =?us-ascii?Q?czdStd4jhIIW9HpZnfKwM2/C0x0mTRhH2K1bnNCO9MkGZzRI9+ZVbhbwGS9Q?=
 =?us-ascii?Q?r0JBgYxDlBvuxDCTmxJZAogS1L6gpVY5Zdit8tPNfNptcBAJU17Gce7bjL8Q?=
 =?us-ascii?Q?SQkidtFKBV9Tr5sk9PuH7vszALooKIfGWcTm3CPXAGEdLVAgwLgLgkBpBt15?=
 =?us-ascii?Q?nZeXo9mvygjfH9tXOs7gsl1J02yxJHBjFiMQkSNex2HfGTckT/1X3gCvCu7B?=
 =?us-ascii?Q?ncrHESWchCTp81yUhmODF53u0BoXyw8=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0b4b2ab-423f-4ee0-cdef-08decbb67c48
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2026 14:49:36.2666
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: neRCa1WtrD2xxwTJlgoiFvIRFyt9uUHleXeRABjtLPulGRfk90wGBWnXCXEUfjwGIq27Ut0HkaT2VlTBMlvpIGPcFMRJa4v9oVlFuz/sQio=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16044
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34085-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kuninori.morimoto.gx@renesas.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-sound@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:john.madieu@gmail.com,m:biju.das.jz@bp.renesas.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:johnmadieu@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,glider.be,vger.kernel.org,bp.renesas.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,renesas.com:email,vger.kernel.org:from_smtp,bp.renesas.com:dkim,bp.renesas.com:from_mime,TY6PR01MB17377.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A2AF3690AD2

Hi Morimoto-san,

Thank you for the Ack!

> -----Original Message-----
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Sent: mardi 16 juin 2026 04:43
> To: John Madieu <john.madieu.xa@bp.renesas.com>
> Subject: Re: [PATCH] ASoC: rsnd: adg: make rsnd_adg_clk_control()
> idempotent
>=20
[...]

>=20
> OK
> So, I have no objection about the patch.
>=20
> Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>=20
> But, now rsnd_adg_clk_control() is very complicated enough, and you will
> add new flag into it. Will be more complicated.
>=20
> Maybe it is time to separate it into enable/disable() ?
>=20
> 	- #define rsnd_adg_clk_enable(priv)	...
> 	- #define rsnd_adg_clk_disable(priv)	...
> 	- int rsnd_adg_clk_control(...);
> 	+ #define rsnd_adg_clk_enable(priv)
> 	+ #define rsnd_adg_clk_disable(priv)

Agreed, that reads much better. Splitting the two directions also lets
the new flag handling fall out naturally: the enable side sets the flag
on success and the disable side just early-returns when it is already
disabled, so the "set clk_enabled =3D true before the rollback" trick from
this patch goes away. The shared teardown moves into a small
__rsnd_adg_clk_disable() helper used both by the public disable and as
the enable() error rollback.
=20
I will resend as a v2 series:
=20
  1/2 the idempotency fix, unchanged and carrying your Ack, kept first
      and minimal so it stays easy to backport through the Fixes: tag
  2/2 the split into rsnd_adg_clk_enable() / rsnd_adg_clk_disable() on
      top, as a pure cleanup with no functional change
=20
Regards,
John


