Return-Path: <linux-renesas-soc+bounces-25198-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A67E2C8A3AA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 15:13:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 45339356E86
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 14:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C30530274B;
	Wed, 26 Nov 2025 14:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Gh6Iv/Lu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011019.outbound.protection.outlook.com [52.101.125.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473122FE06E;
	Wed, 26 Nov 2025 14:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764166243; cv=fail; b=CQmEXOQWjTbsNkopsftnD66CRCJ9T/PL9M0pmn/IAs25XRHapSnjsoUuE01pp8NaVJHL+ZU/UCWT31/RMftkZBmc0m2fjIpv+RAaoVKug6AttzWV2BBgVTGAmVBSsPDhc5ymydszXZFTqeGwTsaIwfOVlMVyNWMMwHrT7WlPvXM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764166243; c=relaxed/simple;
	bh=hSSOkDR/ceUrvCHSdsRrDo4DzXJ99ddTpxOtz0HJnsc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=obWLI2ZZQOLZAM06iJvhyDvKQ7KhUw6tJI5t2j2As8PxQMkWQ5X+r+0TGt5CoOcMEZh6VJZiWoPNkFcmUZyLkcjpAjG2elHoMXf7UwIEQAqsCrrqe1hCRJJyLYTQggWqfMmNi9USB5jwyizxFy65gqZYToLwGrJRz2CWanbYTVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Gh6Iv/Lu; arc=fail smtp.client-ip=52.101.125.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JT96pIuOL2gvLTH90vRYW4K1RZnRFb/IPv9IBsg7/t4z5kkZ+29mUo56pfiuFlwlNi9KfDsZ5PtsyelcWIXq9ISqeDFcZqpX3s/gqZDYmP+1DnWbOlRAfBsEvZuOLgenV2WuJlBGAy0ISzV0ivNoNkSnEajP/7c2Oll1VWYl/IdeM7dL35eLH56c6roktgHnE5oLsqxUlihF/DWPaCVWgQHHQOq8EpLTp5cp3/TaWxFt6Evr9LiNUg8CZxEXWHH9/ejs97kerTKGPRTWpTl/zqZiOBRhk4zn6aMab3eV4zElGvH7sqLXBQIOu1BtRZFvDnw5bxsYr75KihKBJ4RGlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UF/UMAN2nVg0Z+pF5f4Hy3Bwiq9dbot+kznNffpz6Vg=;
 b=Ch++n0RZNv0lJes5qaPIQP9uij55sAj3pFdCKxg1yAtLh+3lbgXm/1p/kIHmaAmrEc16+dCRpuRSTudHhSISBgne82Icmr4YUWbCvb13mLOT9S5wdzDr2PN4fqjgcJrKficz7OknFwDpURm2zGtb7Wg6CJKWatP1NinwsQRPuZb9Wxp+ynzw6YrJzPbrSrUdDYuoWIDKPA5v5JT7HD7vkOnbGqYxubJEXjH+4HBNGU1XFOowkQjyM1VG0G4A7XpA+xLxvz5lsce0p0YLhuERJDSZjiFfHk9N8kW0T661YtsUJctmTy+CVI8AFvBE82rETv3yqWvKMCcu/QEDy51COw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UF/UMAN2nVg0Z+pF5f4Hy3Bwiq9dbot+kznNffpz6Vg=;
 b=Gh6Iv/Lu13b3yBLD5TtA7lQ8fvUONU85e+M4dQjyDqN0bWmjqmUb9MwpZAyV4ekXuiXHDATPeI34lMH8jDOc4dzV33bzD3NwceAvv0kShjTIKI1irJztg+e05zwOutVoQlw+v4e3ecKOiHs/yh6XDZMS2ksaBQd0EqCcR5/k4Sc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYRPR01MB12821.jpnprd01.prod.outlook.com (2603:1096:405:1b6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 14:10:38 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 14:10:38 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 16/22] media: dt-bindings: media: renesas,fcp: Document RZ/G3E SoC
Date: Wed, 26 Nov 2025 15:07:28 +0100
Message-ID: <7b30184db6564f61742594c83c3da072d15a2576.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::14) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYRPR01MB12821:EE_
X-MS-Office365-Filtering-Correlation-Id: ddfc2b0f-a60f-47c9-64d4-08de2cf59371
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?Dy9G++bfOvuOTnpQlM3RfAcHcJ40x3hHGNMAMwm6XRJ7OnWWLsBUvmIfXIbM?=
 =?us-ascii?Q?xHRdKhxmDJVz0B4kGFTJe3uvXptl3TESe10HQueAUJ28kZLu1v1Jc1CqcAfa?=
 =?us-ascii?Q?wo3taRXPJ4brRQ6DhKLgrQmfMEXe5hkSf8xm2F+QIM6MzvF2xrJT3PXrpiWJ?=
 =?us-ascii?Q?JHYYowjxPK+eYTbYfvmM9+9HdbUaBAdQgZoukV/aJ7t0m6HRz2N55ptX2tGM?=
 =?us-ascii?Q?7hup+OEjnsIXpXkTwH7pVYYi+W6eHjbTAY6QDp0NnPv5OcTUrunzKCJ1Ztu9?=
 =?us-ascii?Q?eQPKOfq6qFibG1Bd5BR44ANqUJIGdeNg6OJHxjgmlZ7cZtoiiScbpuy2Z2Qb?=
 =?us-ascii?Q?aiwY3Kcd+PkuwpDxjIwWEHnCTHArnqmSJQyLMlHNGWnxdi3SpMquSKP0CfMR?=
 =?us-ascii?Q?SWwwdFP6vQXafuujN0+2NsH29P9Z0Qn9gnsnPjz/oIUrSBD2MHXcm/yH9Ylf?=
 =?us-ascii?Q?gPyz4J2dRWdrIbeGdudhBEDmuZ17yaPh18WRYF8TuNugew5M4wMIrBg7ZlRB?=
 =?us-ascii?Q?jvJjwz1D4Cd9A4UsUuxSxJtHlT+iB5yNz8z0RZSwfzn+L6o+ubiKly9yvmeP?=
 =?us-ascii?Q?sxUh34Mt7XYaziHWulKWyJo72m6jDwksWfc2yDxa+8oO5bgBoJ4rVMU5cx2E?=
 =?us-ascii?Q?qm7XXawm0LQmmS3ozfWmCckSG9a5fhYIPB0YeNLyl9lV+jNhfCaFF3P43xNX?=
 =?us-ascii?Q?Ei5am/SZG2wmmYVDIx/72pPRR2+xkk1YnyPY+4H/HYGGMzy0d63dn8vtN7BU?=
 =?us-ascii?Q?HrfBWe/zbR4enCGcgQQUGucRkOdQaFXT5rY7r675TH4RDU9HMbaOdKc+yYT4?=
 =?us-ascii?Q?eXWeOe0cP9gT06ex7qDqpi/VpmGQ5seNEy2DvCFHvpsbNB6DvTjLYptDvH1h?=
 =?us-ascii?Q?FGzK/HlXH2RxBZutvHlKsS6/2LAAmpXz1VxOSHqMHQbwdOnbklR3lxviMyax?=
 =?us-ascii?Q?VKj+KseRH9+ypRkuQ2hbbGz/U2gd+fjptMFXekgNJ5dAJdvd9lZOkt0MQeoO?=
 =?us-ascii?Q?+9WJqZ+ZvRAMGlBpbHw1O0MSbAphD58cxzDI3Zy6ITn8NMjfBMv5rRDgGkCc?=
 =?us-ascii?Q?ZWYZXpmNxsCqJ8ut/jiUkAeIaRblohjIDzA0k4h/0xdUqqVSjcxMBzj1azaU?=
 =?us-ascii?Q?NYY66ilhRra1KEgkn9ZO8+LVs0aT9kP+Dg0z/Q3iMVl2VYnGR0kfrn4FA8pV?=
 =?us-ascii?Q?M+IB2bDlh05ABkm5HdbNiG0bWSK4HODS9OLD+C/DdH/IOakuPL4ZZFRvbSp5?=
 =?us-ascii?Q?VuPmtnPB04QR3Kmkx5ZpOzgroxPCtekwDKBrtV2HBLOerr6H1paFFFd2lhDn?=
 =?us-ascii?Q?ZEZs59VgC43uypgJYYOJzPP9fpwAHOF7Tdy9sDl6ydxxUwzDvoCoYqV8YQ7z?=
 =?us-ascii?Q?PRbMPwOy2A1zdf5RGhQhLH4GxeRem54KD8TiAGj2uBXu+Z+WwjHyFjEbkX1q?=
 =?us-ascii?Q?VT/qzBDwt4/KldL45fEf2Jvt5FJwc1sBI7zrmb+1xU4ttkhw4MQ4xDI9EsRg?=
 =?us-ascii?Q?wpkAoxm/AdpLkf4qc6t1/mAPSRLExUqd16H7?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?p0jOG7b9RrC4UgUcoFQ+1iA23JUPDm7sYLTvfi0AqzoJU6IqFZxoeZw1bXVM?=
 =?us-ascii?Q?jdy8yBUdpMNPCSQW2m9fizA0HJMGGAlumifLXx9lhchbN003lGUwIjv2Pc7y?=
 =?us-ascii?Q?lVXqUYIR+5OJ1CCXEWDWVX/3x6r0N1CwWwSOhC+6CvkPsaFmVLa1wuGgudkt?=
 =?us-ascii?Q?0kadiirydko9Yik7VkGwSwOr8DrOyuNZpouPxrBDHAaD+KCZyMnQIAUSjHtg?=
 =?us-ascii?Q?lovfPBQn+zwIGekvPRXzsilfK/LMnu+JMwCsD4vmTGz85f4Ur0YQERFb0/aT?=
 =?us-ascii?Q?pqBLszYzNWLbSSDQDLOdUlbV6KETSQtmJ4dkqrGGqKttEwfGL6y9eYGL/I05?=
 =?us-ascii?Q?oKoHO6AEBrAHWJx795e8iilRkqZezuUymnaWC7sdfxryvzVEiXyKalhjS4wR?=
 =?us-ascii?Q?GfO0spzx4ELo6zEqpNojHd9a3FzbWsV91IdbBqNtRl0PaVNbZYSBD+xfR54d?=
 =?us-ascii?Q?RlZ64KwunsyJuOisE1q1a/obj4CJkIEZ5xduO0sgMsBvRQs03Ylbz/w0Xv2L?=
 =?us-ascii?Q?aqLugJoYDZnb28trJXcpQBAyUVD/XGXXeULaLSo7fdwK2WjMwDJsEd8l6Mxl?=
 =?us-ascii?Q?zlt9HeyFaJWoJrQHfh2ykQmNLNCZQql2djo8TpZwmRxFoH28rLiWixagF5bo?=
 =?us-ascii?Q?0aGUjtfjiss18PSRbNXD37Kne+TzAh7Tu2jlRrrouD+ypYXL/pjXoXXU53tu?=
 =?us-ascii?Q?XstDdlG8zLjetNfUV7AQjwdbKdjDIaXy1ufNvolAtB/oeDZ95oa/3uYH3JUu?=
 =?us-ascii?Q?IY7rw61AuU2MxtpEvaEkbodOMSk7JMEM1r74OT0Do9A9J8HR/1q0TCe4VZBP?=
 =?us-ascii?Q?57lpdbpJj57950y4SnUARwSubRGqvhXxrHviFPcqSD2kegSr/e/i5SEqai8R?=
 =?us-ascii?Q?HY9gfO3CprG7sXySy0nOdMsGh58Y61afUQPULHTPZr7ZeOZ7noHVYrRK0KUM?=
 =?us-ascii?Q?noodUZMSxmKa0TeoW6LGKIuguCN35szrpXeNhTVf06jtPTHjgibXOrc8rux/?=
 =?us-ascii?Q?lccYLnS+RL6kCEaDUZUq1QSUsRCs+0TPdlCi7NuLp6mxPAlgygD6fG84X3qq?=
 =?us-ascii?Q?TUkl3PCVhkUoy2Qj+wC7XAUZbREVPD4F7Kd8gojlP7ZfldTNw7S2incagElA?=
 =?us-ascii?Q?RkVOw33iM4F3cObPTT/hI3pPT/pvX8JSW8nMOg8yjM6T55PyF8hmIs9zOpZJ?=
 =?us-ascii?Q?NfodWvV9WNW4K6k69wTVq45UgIR7ql6V8wCV2H+75SXdnUniyDpI5IMojJPN?=
 =?us-ascii?Q?7Kw8BZ39fY0ETdJS9TY1AYKcuFc9Qnrg4rgjb/3urfGhrDBrspsK64CG1D2s?=
 =?us-ascii?Q?3vJIfml8GMYH54ahEcVTDW8tOVeCvCaDATu0tifwRekHhnQeOy20hjg9ezA2?=
 =?us-ascii?Q?lSX+bsf6wtN31Iws99j5kTZ3Jg1nE9wyDOfUPPnu8ulFzjGcpB+MMgI1Cj0v?=
 =?us-ascii?Q?444IlXsAyFynelS46W9IImJGt32I/+FB7HDy2STkZJ2HmKgfIjLrmQTcfI9t?=
 =?us-ascii?Q?9igeXnpIkfiyfXB8mUbxOG7zIo0M6zj0jCj509bzReEf8XgDqRJgDudXQBAq?=
 =?us-ascii?Q?EtummSgp7AJWql34H2k48Q46R/EbqKxCMkCxP+5TsvjZ5GrXFlZq7/F1DZfZ?=
 =?us-ascii?Q?DQ1gAWUlRAJ4jJ5o2TOngdg=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddfc2b0f-a60f-47c9-64d4-08de2cf59371
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 14:10:38.6338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oXk/f8xr80NpEgfoFW2A6Jl+SASjVkwJEtpDhZg0bmuzQGEu7mqQ+Z4CLf3MCeEp75HFATr1hpkWObGNfH7CCbYaPLy+YT14h1Yj0HUFpvyHvZ+tMYsHrx+xCngFkCAH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12821

The FCPVD block on the RZ/G3E SoC is identical to the one found on the
RZ/G2L SoC.

No driver changes are required, as `renesas,fcpv` will be used as a
fallback compatible string on the RZ/G3E SoC.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 Documentation/devicetree/bindings/media/renesas,fcp.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.yaml b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
index cf92dfe69637..68c460c4a038 100644
--- a/Documentation/devicetree/bindings/media/renesas,fcp.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
@@ -30,6 +30,7 @@ properties:
               - renesas,r9a07g043u-fcpvd # RZ/G2UL
               - renesas,r9a07g044-fcpvd # RZ/G2{L,LC}
               - renesas,r9a07g054-fcpvd # RZ/V2L
+              - renesas,r9a09g047-fcpvd # RZ/G3E
               - renesas,r9a09g056-fcpvd # RZ/V2N
               - renesas,r9a09g057-fcpvd # RZ/V2H(P)
           - const: renesas,fcpv         # Generic FCP for VSP fallback
@@ -77,6 +78,7 @@ allOf:
               - renesas,r9a07g043u-fcpvd
               - renesas,r9a07g044-fcpvd
               - renesas,r9a07g054-fcpvd
+              - renesas,r9a09g047-fcpvd
               - renesas,r9a09g057-fcpvd
     then:
       properties:
-- 
2.43.0


