Return-Path: <linux-renesas-soc+bounces-30088-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMLSLbqxwGldKAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30088-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 04:21:30 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9D82EC263
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 04:21:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 99F983003801
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 03:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4A58296BCC;
	Mon, 23 Mar 2026 03:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CW+w1DT3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010020.outbound.protection.outlook.com [52.101.229.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3A2299A82;
	Mon, 23 Mar 2026 03:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774236087; cv=fail; b=gVWOehcC9w3gJt/6dkSkop56KUXiAXZ4fP9viEms6+f6DXfGaCfrCi4TCoo+ZvsZPpAygvelv2AhYfjlwhMOmdTt6T5s0bK5LehT83M8uWzVeK+CnaQfqDbu69hjDbE2Czw8ONmy72+4ZBbB6/+cUjfzcyu0IJzsX4jtapHjmyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774236087; c=relaxed/simple;
	bh=C/+lzJErbYdK6V4rTpbF+KUMesw/CEmdZDLU/kQKvtQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WoyIwWTv4YsmuvaI20XNMufEFmiKdZ8GohSpSUomFhOfCbLZ6AHI23lL+XVeIxihauSYYGMENpu3GCG95tAck7npivFmfxKnhpJ0Iwb0DdYaWmQmuN6yeoOO2TCXYO+XwFJ1jhLWeFpFypOrk3hEmw4R/twJhDQWamgtfeFd+hc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=CW+w1DT3; arc=fail smtp.client-ip=52.101.229.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mR7hXGlW7mJUid5WM8sS3Q+fPUGISHJC46/uXHPLRhFWqp57zUBaqEXT9yJUN3PnqdQFk6FlYH+sJRgs7hNclCbQCoB609hSGlV5IoM4K796EeccRHykUfvhbt5Cn+WmbOzEcF3BbPgCGEAllOqoG65KCXNLCpL12MH5jPDqZpclJhTKS5yYCVRiuoTyO4ozW4xpJUS+rgNZt9iooYE5U1P3eKZ9cMlhKGPfAhRuTBKW4pEJjaGrDImXh125rXhbdUo8C5RsqSQ1ClrZ9/6j8ojrPGsy7qWLbtguSB/ULHtlEPMZrW4217sCQNL1tbZaWY187cAnSUp1KEdPyoqM9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KzCqYjoRBivFfvp8RQq7M343N+E0lfG2sExjrk994hM=;
 b=NOtbioSV7EQgt87NxPhQbSd9CaeDk5MhgCwx2hfiXRrSKCqjzBG/qGupflxwWxFu/Mo+nL+gJJMWYXT8wdXP7N2THqj3fl++AG+dodvx1oGPD9H7qqdnRekGtb5F9jFnD5i3IzsnhOxRL4yCSGEWVafmI68rhyoz0+9MryRk+XizGU1JuUFJFmtXtF7myorQvO4wcOh1HdtsYiccDk9zdSY4Lasys524s9pnuJHBjV+gMjxra3jCRBOKGv3keScvBSwgc2waHC0/ES1VsQ4VIXBAMYNoFGxEUHwIF2+RJPJ6fJNQ5RuLrY6BSnJusbPlaDLqhP9XotC+ASqeVz8vng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KzCqYjoRBivFfvp8RQq7M343N+E0lfG2sExjrk994hM=;
 b=CW+w1DT3+hLxhjUPK5g0VbyNFkjEP0d0LYBrY+uX8PlrerVRzrw/9McDAfYQf0D+egjWqCH8/FjC/EzQBKJujanzV/bbX88AnXcz/JUFXIyt+uONveHgZXgPI6zY0aeAFcFUzGwND8DB6YAQYw3NJMWf33xyNW6XaUep8d1DtUI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYWPR01MB11935.jpnprd01.prod.outlook.com (2603:1096:400:403::9)
 by TYTPR01MB10922.jpnprd01.prod.outlook.com (2603:1096:400:39e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Mon, 23 Mar
 2026 03:21:09 +0000
Received: from TYWPR01MB11935.jpnprd01.prod.outlook.com
 ([fe80::dc30:6b24:b7ba:d429]) by TYWPR01MB11935.jpnprd01.prod.outlook.com
 ([fe80::dc30:6b24:b7ba:d429%4]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 03:21:16 +0000
From: Dawei Liu <dawei.liu.jy@renesas.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	grant.peltier.jg@renesas.com,
	linda.xin.jg@renesas.com,
	Dawei Liu <dawei.liu.jy@renesas.com>
Subject: [PATCH 2/2] dt-bindings: hwmon: isl68137: Add compatible strings for RAA228942 and RAA228943
Date: Mon, 23 Mar 2026 11:20:57 +0800
Message-Id: <20260323032057.953-3-dawei.liu.jy@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260323032057.953-1-dawei.liu.jy@renesas.com>
References: <20260323032057.953-1-dawei.liu.jy@renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0013.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:2::18) To TYWPR01MB11935.jpnprd01.prod.outlook.com
 (2603:1096:400:403::9)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYWPR01MB11935:EE_|TYTPR01MB10922:EE_
X-MS-Office365-Filtering-Correlation-Id: 56aefa58-8d0a-4c85-7bae-08de888b3e7e
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|1800799024|52116014|18002099003|22082099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	vGfmHw+ls2kwoz336wiO01AzUxGaVBpYbTdwuvZ5TKwWe2+46RVoaLenKl9511zvLcMcSkBkgX8LqfV+c3lekHZvdfnfsg13WaLAerdX8DNvqCSR7h+ANbkgXPGzObudICfCK2zvaIo6b2oMqNoHlXnjMixGbd72csHVAOnpn8ogfk126O9c40xBHu8gx1eJsa43PifEss0qqlJkDxU+NaoABVdhR+MykzcrPKQERqikOamQV+dF0Q6X8Q4559fHXOJsI4QQyfKW4PzCgOAKM8GIsMAAjOaAYcgxOGyKghoTqL4sUYP/7pUlPd3p40BBXtJ1aF3PtVNqXlVqXj3Vl4SIiAyyefrhde572IiJ90R9tfLUo30xtYIjTdgz1+EpGQpcijd4LeuHf+oWxaN4tGL6kOag7iwB5R/jCgp8nME8r/gO9vD/FdYdx2UzXBcK3RciO5QfWOhzmAwE41jOsNEVKJgXtpdMJchDza6+7c44CoQuKiLQQ5Z3fgqIMhSgfSYlLozIqOIAyVu35ANsHu1FPLffOEveevh8woSiH5WBydAZPZ/DnWgRDWejDpEZ8/rZV1N8GHpq/6GwLf1OS8YeCMEC+r9Py4s47yuVkjoYRXLlXxqABsZP1Bb8folsSmV47/+gQS72m0GsIJoQomk0n6nbcwdcJerRz2wH4/htF4uvgp1StncVTP9qTwNdYYj3FNWA+ZS3qZHcNh0MFXm58SAOcW2cObB8zTiW8wddv42cu5Y5hPUCNEzIrMB7UKLill8BgwBchXjtznaumiuE6UuMZw3HrQM1O/j94go=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11935.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(52116014)(18002099003)(22082099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Wdrf3E9ktScZ6HpjfqBOI8FVHT9urKeei0MucajkCDFWjs5vlbH0nYwNuoke?=
 =?us-ascii?Q?7xmoZiux2aoQp7lydYBAm/GzFEhtj790QseF05GJRIoflbRtnoB0RACIOCRi?=
 =?us-ascii?Q?cwQnqOtnZpKW7Y5CWxQlPy76L1GMD1lwizk+SMhcf7gujiUlZauDddfz84Ak?=
 =?us-ascii?Q?PX2TwgnuWzmYXjqmRqcGmjX0JUX1CdgZSrQdp1Uk+ChiMbENPfGqXYs2N6h4?=
 =?us-ascii?Q?iyqbELRb4n2Hqikes5m/eFXyyxfqhyroEhNlEOW0C7CHgiZ3QafGIPY9StaK?=
 =?us-ascii?Q?QJJTdThuGKLfsJSwfytXKerjlrgEc+x/KkKv1T4JlZ3cMSd9lTzXCjA4nDXE?=
 =?us-ascii?Q?iS6BOwMK4GszxeAJV3NWValGdoR1L14+fmr3EWU1oCcgvKrq7H/E6ilct343?=
 =?us-ascii?Q?FpDQvtWPHWaNop0oBHoIH/zjcKmdh659g9xvzNh3VszFo/S2vbopLBiHtpdi?=
 =?us-ascii?Q?xHREy1i3x0R4ZUbQ0rV9VeGXSO5R/cI2RElW9KdX3CVuI0+Umqn0YpPMuo/i?=
 =?us-ascii?Q?Hl78YtfNLXyU7l4dsbPUL5D5XU/EkNrE7qwgfLowbOetklWAtVhkMkJUny6V?=
 =?us-ascii?Q?hBKDVxI90a77kLjUKhTSJ9PAH5o9czLu0rFRAp0TBJtL5yUnpqwrpOX/iZKw?=
 =?us-ascii?Q?FyKj15OvLdtfHuxald6yoE2mgAYnacR7huh3hLEn43mJHiABEduFYE7I6eq8?=
 =?us-ascii?Q?XFtvpKuACpKCFZn6DDN/h4UtZBu0saSqxglVuCJWNWOjjnvRGlpJKXvGPugv?=
 =?us-ascii?Q?Hl7FvT65EwpsdaAhf0OQsJRxGx6FIdk7AZPtU7fX9eVSQjm4YNp7+ih1/3dc?=
 =?us-ascii?Q?3yEAVEQ+vbhNJD/yccUt6upaeI1OB0IDDoerdg5vbRQBKrR17tShTNUuqfRC?=
 =?us-ascii?Q?npTPP1jcQjodnVpj8/6sM40Yh8oe0sHWoIhiTYBZ/uPblh0OL8CrWBs5i+ul?=
 =?us-ascii?Q?r2xj5VNxmqFQPJPa9z9gQPYNDfgo9QkHvzthykajoC0o3eKE6/3Mdp34a+3O?=
 =?us-ascii?Q?MIWq0L1lqAQVkv7rR3RzmLdwHOg5zKa/veGnsHMJaKnEVQ/UPr2GFfD4e3i2?=
 =?us-ascii?Q?DC13uWIIABbPwZit9n9q5gcEchAGnCydGNKEXlN9D4RHoJ27fk3A4icpCos8?=
 =?us-ascii?Q?MNEfSjfJFiL7Q5itBNdjtbIzYkXPTNHDxvy7NykVpcjuW41/CpUJwD21Ck/h?=
 =?us-ascii?Q?JvnE5dLMz4lNU09dpNA6R5Q62BnGn+SRic9vxLJx9lL/ZYI3AntmM10HB+R4?=
 =?us-ascii?Q?mQs5R0KiJp+mt+oLWIfNEOdSobiPTtyw30/czUITQl8ZcLMQ4UYb+nFj1+Au?=
 =?us-ascii?Q?XaGxbh9HLRN1Aia5Ghb1KMmpq88jmEIuIXxUmhJHTkWGZS5dl4vR10snnuoA?=
 =?us-ascii?Q?pJCWZU2qtugPDgZInFlTtiwByQc6Rs+LWqn+y4k6kmrWNhXjqgniTGei0MCm?=
 =?us-ascii?Q?q/DSvODq4DKDfpgNr078YhT5eMlt3YlXuaQD2ADE3c3hGzKy+jLBL31LRo8A?=
 =?us-ascii?Q?vymzolflE0bBkgdDDyYqCu/x2C2GIJjy9NgGD0VgeYTNQ46lZ7/nHKexMsHd?=
 =?us-ascii?Q?YJd28TxuNWVzy9yOE4mMVFuN3UueMIJr4hPSG7Duw27UJf9+TglH1z/vLVYe?=
 =?us-ascii?Q?L1axuPFyt1erLPSZOydCFOj5gboIJG+5TXJswJI3zodsMmLWM0z+IuJS6ZeQ?=
 =?us-ascii?Q?YZknJ3sARv0IWJHXoq7NaflEJQYeVBjvCrTRRJrbT6W16c8JTP7LvkMNSKGB?=
 =?us-ascii?Q?+90GJn7iAw=3D=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56aefa58-8d0a-4c85-7bae-08de888b3e7e
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11935.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 03:21:16.5556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kO4za03Qc2TaGfJ+sNKTtPFfaqAW0dIuzlh6LliVvoBn00XUaAn7ILkD42JSL2nvOI0Su7lq6GNUVq2Oe6PkVVF0el1zkkUr9K6ZAjkawUY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTPR01MB10922
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,lwn.net,linuxfoundation.org,glider.be,gmail.com,renesas.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-30088-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dawei.liu.jy@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5D9D82EC263
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

RAA228942 and RAA228943 are Renesas digital dual-output
16-phase (X+Y <= 16) PWM controllers with 2-rail non-TC
driver configuration. They have different hardware
interfaces and feature sets compared to existing
family members.

Signed-off-by: Dawei Liu <dawei.liu.jy@renesas.com>
---
 .../devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
index ae23a0537..53d07c0ce 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
@@ -56,6 +56,8 @@ properties:
       - renesas,raa228228
       - renesas,raa228244
       - renesas,raa228246
+      - renesas,raa228942
+      - renesas,raa228943
       - renesas,raa229001
       - renesas,raa229004
       - renesas,raa229621
-- 
2.34.1


