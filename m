Return-Path: <linux-renesas-soc+bounces-22548-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3915CBB1D5C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Oct 2025 23:30:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0A5A19C5478
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Oct 2025 21:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D245131328F;
	Wed,  1 Oct 2025 21:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="M80IrrVr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010006.outbound.protection.outlook.com [52.101.229.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC76312815;
	Wed,  1 Oct 2025 21:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759354140; cv=fail; b=mKEMcG3BjeSdd/jWlEfFHmL381AQs5cIprJ2MdLy3krF1HwnMBV+EwIfX+1rN9d3V9bY/9xi0Fr+OrpETzl7r6KYYOFcM2bjf0pqJE0LFkpvFR9afq2055qmpNovN92ceq5bFUMRfmumNTHrjD5pLd6n3SYHuHdL7IRMf2wjlpc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759354140; c=relaxed/simple;
	bh=NLnhFG81I5Gv3iPwygNDoyi/IfW3ZOXIHRA8CaAax/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fYaVHuLwsM7yRbYKlpto8Duc1jlwp0Yam6glmO+FeFlkEZksbbYh2lK5Z7W9iuAVrllE2Lof4qVVKQwTuQS29rl6hMNbDULyv4W8ZHncIWkbhRGRs7N5yQQE/7cmhrvw1SDCZCj7wpf2z/IoIlS8DXvHklL0COZ34FbSVLQMrhk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=M80IrrVr; arc=fail smtp.client-ip=52.101.229.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XU/CPB3/p++Ish2wR5afpY6ukQbwB/h9ozwD29/thoFDs8TETpJVnLwtx40EXxqEUxbIXGfXjKVw4CH5Z+dYa2VcbbbxqKHecI0x8GlKSlRz6TqSOQjSTp7FmzvQN9Oed5nUGR4GQqWipjUJibtuLrBRrMJvAvE4q8CMkhhZRRcuDsx56XhzkQp13mwS/86Cc6Ki9l17khQqhzC9ktuTglW68mHWcLgdC95w9NXNjSUOywZKnO29PAll3d7rojMyZ0bYIL/v36rvAHyPKpV4wIoWiWISkYRJ1rcOO5UDaNbMf3Z/i1dqGdTQV4WPdX8daWb9h4SaAvvcL6AoB+UJqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TtSjFSww8fMXvJOTQhm57NhpgPSppRRsV+n7IZyME8s=;
 b=tDG+J/XF0j7u8d9tnfxt5uTFWp434uZpc3uhh58OHKPHgYAOT94z94GOzZ2aRyZi1diRJAhi8g/+tj5AG+N7+ch4d/SMkjJfW9QzQCL1XDy4CYFCZPwmMOtKS06IHXEcnGUX2VkXn4HbUjtWP4xGDv0qOpCIqcCqV3vE5CQdFZNloeQwIjdFwq36vXNPDgqoLiZAIhzySVpKqE8BqeuKSb9XVsirYlgj8bPWYRNYe4TaMn2p8x6vf2tPXeqrg2DRVEDy1J7nlxvsCGrpkSZ0wwa5dPRG8WX9/qNTPpC/Fjd7n2+rUGzobvXwsmLX4tECu5vRQWC1a4gz3rSoiNxHJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TtSjFSww8fMXvJOTQhm57NhpgPSppRRsV+n7IZyME8s=;
 b=M80IrrVrmOxnAq/VG8UsUvVbOiqNanIMoK6QtExElsGmcrulgIQ5NAWNcspV24ve0BloJOIwrppao3g4AakI3Xi2OHUvVnvW439gpRXlU7f9lcFeA18fOjpx4WueRspAmxCP6p78vxi4sxSR9RVxPpZTuS9CrmarUlZzhY1qr18=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYWPR01MB8332.jpnprd01.prod.outlook.com (2603:1096:400:161::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Wed, 1 Oct
 2025 21:28:56 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9160.017; Wed, 1 Oct 2025
 21:28:56 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: [PATCH 12/18] dt-bindings: reset: Document RZ/G3E USB2PHY reset
Date: Wed,  1 Oct 2025 23:26:56 +0200
Message-ID: <20251001212709.579080-13-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251001212709.579080-1-tommaso.merciai.xr@bp.renesas.com>
References: <20251001212709.579080-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::18) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYWPR01MB8332:EE_
X-MS-Office365-Filtering-Correlation-Id: 79035d6b-fc57-48a9-c7a8-08de013186ef
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QegtFGy6GfEDpF2+wXloP5fRXWXQUQAB72R5FCo++qEnCtNvYFjghN/yzoQH?=
 =?us-ascii?Q?R5plpPO73ZRGd7dBlLbsXpPSlaf5AJAN8p0fHkl9w/OfmC2kvnpnZywFBCBU?=
 =?us-ascii?Q?H+bd9+pucT7JfOvxnuc5eJxsLnxPLN1sIiinENOkgCy39scKjMEDI5AYqiFU?=
 =?us-ascii?Q?4FuwXKp61dyXh0PFaQ4YkFyBX3NtEKzmaPlzUf/k65uAwhUTUFo5UD2XSwCS?=
 =?us-ascii?Q?4dsjQPb/5vMGlxoPBe6mc9u1KWtXg8OL4muF7AdvBGM+TYE1Tn9oLo2UrDO6?=
 =?us-ascii?Q?GlQg6q+ETeW8An+vSjoN5uT8lev98k0J0HherxMa2US4CgJRgV983xGJOP8x?=
 =?us-ascii?Q?8HD+nVicRC514ebBPfP78Eg8V1cOaW9Ehvtm9M2pSY+/uP7+fFtUbXZZ3LUs?=
 =?us-ascii?Q?hOMrC89occeI4URMoz539ojnBrCGg65E7XQsq9uwu7ErgOqORTa3RHYqGKgm?=
 =?us-ascii?Q?zSK6CMGhZV3E/GjL3E61FPDJ0o5Pzitx34GPBrgokA9ElT7yn2JUw6l1tA7l?=
 =?us-ascii?Q?xgdYevW0fAiU/hItF9Q5E0yVhfoZ/O868fZ/cgAX/IzhGRfzUvhBuSyFZ6t3?=
 =?us-ascii?Q?U/tDrjQDqzgyZGttJUNWauWn9PQVfhsqin3yCnza3BzCmMoF8Bcs40yL0LRA?=
 =?us-ascii?Q?KQ5G9sJUQ0e24DdMAaSMxg3uSmLZtFNxIZPRlZVZVORv72HMo1FJmG0tnUIT?=
 =?us-ascii?Q?+3of7hrtF/xtrt4mT1atQfCEbGc5K4fGrDzPectNM8Lf53kt++iINqFF+5LX?=
 =?us-ascii?Q?gvYQ9GZKqZA054wAm2gmth9uPfi7b+et7EAo8A2wgGHHRrZfA63c/2oGw6rU?=
 =?us-ascii?Q?BBzM1q9iMFU/1xOdH1RjwQ8DY5H9eYjrIfwzvKU/TlZDX6DFzzzQCXo4m//v?=
 =?us-ascii?Q?0MGSwIMsbwsCqIGHxCH613VVeY8yAznOOfpqJhW/cKrrk0NpA8/nHVvfolYn?=
 =?us-ascii?Q?wp+/kSdrGXXSuJ7+qXaRZgcn6GHPOP4zeFLoM/1U//A7KlQ7oyi8uxpieDhz?=
 =?us-ascii?Q?UMbwCNsT7WmidJ0qQFXbPhR9r87g7D/78kA7fKHPMSg0goax/56YqUlVAbwm?=
 =?us-ascii?Q?K1cEF1xY7//pC4yi+kpVsfA7O2QWglMdK70t9Mr3ZG4w9gueCRUrYNiA16HY?=
 =?us-ascii?Q?B1yD1SJcannIUqnRpaolgYlQVxezBXfsvlRmoujPIEz4pzMcXF5v+7udeFhO?=
 =?us-ascii?Q?cuohIu+8Ai0ytM8ZbMNZSSf4EPRi03Y+e9KZWq+w6XFdaJNprAxCGhMU9kfz?=
 =?us-ascii?Q?CXuahOHxQa0BcvyN1zaERKU7kIeGiCK4I+5o2L4DAPu0No6DiQyZ6ENK/oIv?=
 =?us-ascii?Q?PMmqlqSCWCwdCfj0W8UeppeZWI3/rOSvBCM7rP5UIWayBfh+WFnFZsYA7PHH?=
 =?us-ascii?Q?mwYzdlH/UoVi9sheBijCDyASE0dIQyWZ1CwcfYaGO5MA5GbCqWFZvUV/uXDo?=
 =?us-ascii?Q?GtAkPPhqxnYpqZFaPiSmISzoAxvPz7dhd/lnyEQANUkDfs9LkyYrBKvrQ9Ig?=
 =?us-ascii?Q?6yBUvrmLAY/m5isBNui57t/lcWPlwMuZQwX3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wKEUmPbCHdsvVxJ97pKhpjJ8nIwXaJcC4LioUdLZr4iahB7xseS+q/u49Jn3?=
 =?us-ascii?Q?NoroI0hZyWyP4HB/vMd/7dzLX0VxN2Qi9Qezy5RVMqdSVSf9XKWgNYhOti7g?=
 =?us-ascii?Q?WX9U0Q89Fuzms1RayyuEcRhU79rZHRrtovnIwB6fc1wH94JgGhBjQu3giigg?=
 =?us-ascii?Q?dOPRDzO6sCpHn1EFln4IjUydvsvJ5TrRGvf9qHPevalqm3D4la3JMsfbS7Es?=
 =?us-ascii?Q?SbxrDw5Z914DgIIVt3XpETjPljny6/MQT2zOL/Jd+NlcsA3D9UZU/an+QxXL?=
 =?us-ascii?Q?2FEt3SnijFPDeOJ8az8tsF0SPTghisaeFA7XPwm8L97gF03hZ8qHIUHbhqTD?=
 =?us-ascii?Q?A9ey/bxBHKYc65gKMH+Mu9esgOMIJm/8y/surxhvjwClLn07+U8dYnlScThX?=
 =?us-ascii?Q?5TS57Y5Tl0H6goxY2JQ9R8qoYD4KcPBrDCEuM7sKv/FYwRa7UHZdFWfQRZub?=
 =?us-ascii?Q?LPEiET2g/cKHsGYYuXyNwG4YcjhfmZ6mwowWcLouNH7x1hqTXQoHhDdxiz7u?=
 =?us-ascii?Q?m96Md3RP+/9WYAucNM5X/yaTBjODH1N+M+TTf6djC2Jim0fNLXghtbKyyPup?=
 =?us-ascii?Q?zkNpYdwjuqAASVyxbZ/pAQ90tzaFUCa7h4kC5CPhDpZZkc3/dogGvDPA5hgw?=
 =?us-ascii?Q?MftpmAqH9Ptfd/6cSrjL36I/J5ozGavCLd23IFeBAyxh1eMW2hL0XiET1K38?=
 =?us-ascii?Q?Qu133ty2Ekkkq1lrmGqhMKM3HtsNCidNyQhyDfoghRBx+Ga8CrRwMQLUNDFt?=
 =?us-ascii?Q?zh/tzDGubeKHanLNOzjkszhAexwo+3r8VtIbcBkm0JhSqxIj7iuX/TavVc5D?=
 =?us-ascii?Q?iin9b9jksudpv0P6tVPhSlTlKiZWJFZbDqYn5A23q8V7TJhxSh0ZEbNimM5j?=
 =?us-ascii?Q?uS8goNVbH3DN8C4/9IDPzLOp0y4Jyu7LkHTh/BodOC4XjVPpsydxNhwHljsA?=
 =?us-ascii?Q?snRfVsXi7IJBSgstx7qyK7HtsDIcnwXdjNiSk2FF+t9uqMLDK+mT9Mmw2K7Z?=
 =?us-ascii?Q?xiROy6UEP/epR6w56x9FGJ0J0vRCI/Ad4XOhhSzhQYHu18lhouo5QhTQFV0E?=
 =?us-ascii?Q?xXMNqJ6OZJPTwhNUW8q7ILvKssZCrdYgKlYvRKfFgWRC0kuoXyy7j+LhDSsE?=
 =?us-ascii?Q?lSl0vV/M8i+fzs363qodEaM6DJj5jf8sjUWIAKs16MhP9haIe5gptXUqCpr5?=
 =?us-ascii?Q?NppNpg99ev8DM1aan4nDrUlraw1fY4KAmkdgx5H+WGJ45NuMEZX3JEqjrR3p?=
 =?us-ascii?Q?ZyuZyEfRANmwsI9vIS0o5sA3oKdLJZLf8Ler8DvoFqwEGN+c9Y7KUPqSRVwE?=
 =?us-ascii?Q?EkxbzMkYjDlelKV2TYQTHhnNH116AUtjADW/orJfcFJ6w60Sio+1luAhdWWz?=
 =?us-ascii?Q?Ig2fn7dAu5smjpiwv9l0U422j1/Nhw56f1IofgSUHKWgIR4OkUtF1mWaH7b6?=
 =?us-ascii?Q?tUKRfUgpIXr5vIWtAxrJ5H22dUO/loxKX70PMVfJwCEWGnb+BT5chmk+FVM1?=
 =?us-ascii?Q?t4lAuVG7lJe76StmCZ9JJnNqPm6h6e+zZ423BXgjhbMdIUH5lX/Q+1kkhmOm?=
 =?us-ascii?Q?b+TTHp3ngAsrSoaDOyNEes7MvN/dE14uAPPFcYWorvF13fYvec4NEfagjZU0?=
 =?us-ascii?Q?5D5x+eflhF7c37KSSIgYVGQ=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79035d6b-fc57-48a9-c7a8-08de013186ef
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 21:28:56.5929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MlGoBxJDHuA9eeiRd5yT/t4L9BXCTDqyTriJF37cn6FM1kilsv2KPFqw613+pIzLgKy5H+0a3ZmjZd+nxL9ihfxuZZTZKP2vsvnnQ7xkYOEN+OF2ENQXG1z9k2GczivG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8332

Document USB2PHY reset controller bindings for RZ/G3E ("R9A09G047") SoC.

The RZ/G3E USB2PHY reset controller is functionally identical to the one
found on the RZ/V2H(P), so no driver changes are needed. The existing
"renesas,r9a09g057-usb2phy-reset" will be used as a fallback compatible
for this IP.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 .../bindings/reset/renesas,rzv2h-usb2phy-reset.yaml           | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
index c1b800a10b53..567c998d3c85 100644
--- a/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
@@ -17,7 +17,9 @@ properties:
   compatible:
     oneOf:
       - items:
-          - const: renesas,r9a09g056-usb2phy-reset # RZ/V2N
+          - enum:
+              - renesas,r9a09g047-usb2phy-reset # RZ/G3E
+              - renesas,r9a09g056-usb2phy-reset # RZ/V2N
           - const: renesas,r9a09g057-usb2phy-reset
 
       - const: renesas,r9a09g057-usb2phy-reset # RZ/V2H(P)
-- 
2.43.0


