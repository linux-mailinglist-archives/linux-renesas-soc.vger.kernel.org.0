Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60AC63B96AD
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Jul 2021 21:41:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233893AbhGAToY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Jul 2021 15:44:24 -0400
Received: from mail-eopbgr1410135.outbound.protection.outlook.com ([40.107.141.135]:23403
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233631AbhGAToY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Jul 2021 15:44:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kAbZotdEcnz9ngVimqpsagxZp7LipbPYUJDn82pyh46cU13KM82dBJM7SEQ19Nt1tmNVrwzzwxQBoorcQCtCUHhmxSr2mL4/OmadCMszIMpC9ua/lOkeVlwRCJIWGn+e0x2Yg0qekLjUNy9LlextrfzKXvbNmJFnBx2B9XXehp8x7VofjCn6avmCw1e4KEi5LjZYmmEqQhuMz6ynFYSMzleaz/jcDSdhYqgB/LB82RIs1/29kylE8++RHdPoDPm+1jKheeAqfp3ZS5ZHNJYbG8fdDXSB8Ag8JS10dLutdK/BDuU3c4MBYmqInnj+mTpPCvSJqsxBGEb9cbMh9TIImQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a4pT4uMI4kVrAhS0LVDnqeidF9YQ5M22iylHuWyeq3c=;
 b=gYAQAHZxK7heEPa88xC+zMUCpgevef5Ng/nIsgYJQ5q8JKOIztg+bZ7cXazJdcBy13lgt80VBjttZldSG0X3YugS2tNCod48pGbEy/2Vwz3F5TEY/eJLiDboDIZd0fc65VMltZ3SJuZRS4xi8Sj6xfpPv/IeyMuedvrwwCaw65QgfPcSe7mSEzzqlCHVOd9BafWTAUfzJDF3OIUTzeB3pOHszoTROOfWiqdf/WWTUzU2toCI2CI4NbAxyOXDjDZxJhsq9e4sA6Mr2HEprny9uokRchCjwyittlZ8jn/hWPutgj8C1qk46MdlaSFicm/USOvLamL75nl+VxeXQsk84A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a4pT4uMI4kVrAhS0LVDnqeidF9YQ5M22iylHuWyeq3c=;
 b=rgT1UIiBaAqkQKx+Ve7mTJIR9iPPWLoQ2qNcr1tUfG+BnXkqNWa+/nV1nBCcu4TmGHxOSm/uruVR/CMMHnbd5liFuOOx/vMdM1HRUxCQqtN8NGiFZdqnPrqEF0jwZjXyoL7DDR94x1owYjkaE1Qsi7KOm4dtEmLenfHC7e0E62A=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=renesas.com;
Received: from OSAPR01MB3892.jpnprd01.prod.outlook.com (2603:1096:604:5b::23)
 by OSBPR01MB4021.jpnprd01.prod.outlook.com (2603:1096:604:4f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Thu, 1 Jul
 2021 19:41:51 +0000
Received: from OSAPR01MB3892.jpnprd01.prod.outlook.com
 ([fe80::e1ee:a98a:2ba3:aee4]) by OSAPR01MB3892.jpnprd01.prod.outlook.com
 ([fe80::e1ee:a98a:2ba3:aee4%7]) with mapi id 15.20.4287.023; Thu, 1 Jul 2021
 19:41:51 +0000
From:   Alex Helms <alexander.helms.jy@renesas.com>
To:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc:     robh+dt@kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
        geert+renesas@glider.be, alexander.helms.jy@renesas.com,
        david.cater.jc@renesas.com
Subject: [PATCH 0/2] Renesas 8T49N241 device driver
Date:   Thu,  1 Jul 2021 12:41:33 -0700
Message-Id: <20210701194135.18847-1-alexander.helms.jy@renesas.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [68.225.135.226]
X-ClientProxiedBy: SJ0PR05CA0147.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::32) To OSAPR01MB3892.jpnprd01.prod.outlook.com
 (2603:1096:604:5b::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from az-ahelms.na.ads.idt.com (68.225.135.226) by SJ0PR05CA0147.namprd05.prod.outlook.com (2603:10b6:a03:33d::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.8 via Frontend Transport; Thu, 1 Jul 2021 19:41:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8d039e6-cd67-473c-0ee5-08d93cc8458f
X-MS-TrafficTypeDiagnostic: OSBPR01MB4021:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <OSBPR01MB40219AD080CC322B519B5249C8009@OSBPR01MB4021.jpnprd01.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2NVnz/rISkm3UsDmSmN9qMs0tgW8y0ArbXLmRcrgOXh5DcpNKrMGCJhj8h0DMFlOJ4aoB+loJw0DYsKdDQLBff/mcpd6RvDu7Kgq3avW6P6vJEmOyi7m14IHDb2RHmem1ney1vqmGg6AcHNhN4uVcy4mhRTS9+x2Thlck0E79lzl2UdcTW7wwHYFaJRaQsAF8UDMK42p2K/pxYGiw0RHGSmnzx+N00Jw+IwiBlAP9qcMnilDMBh6rve/LsUPhMMwhpgf8Py3koN918hTKEp4eYfAXvHh7FSwK/lXi3JVTEJAbhhqsBqc4VOB95iVGj5vOvJeHfuT9rq0zim+A7okHzRg4dRv4mB3XFx+uGbBaIHsNwPIujbQB6fkW8rs3SbuCZwXiZjBWp+vc/of4APmjqL1I3X2XpklWDNd6tT+rO/ID5q69q5igv62HfEqhon9satuCED1X590THlB+gh79GqBoHRmEYxjIMogkA1OUOU9kQKsnv+Urwm/vzfLEK+p60RU0xbgfkpsT1ih7+/M9Pswm7yfpqqNU+QJwTLf1VczFhkIXbMfVs1HeR5oYeWrZCIPDpj+emNr1bpvqvjfRKOGiqKSgvkJv+3qrVNdwXIKBD2K2wscspzY0zC+9bw2h3AopKj1jglteP/FqNa6MsNI8PQ187zAeV/05EiEEO7vBNXMYlXvNszW8dzZ2nz1IHEBSPUt9UWeOJgA/UfA/A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB3892.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(366004)(346002)(376002)(39850400004)(956004)(86362001)(2616005)(6486002)(6506007)(66476007)(4744005)(66556008)(107886003)(66946007)(478600001)(1076003)(52116002)(36756003)(83380400001)(16526019)(186003)(316002)(4326008)(38100700002)(26005)(2906002)(6666004)(8936002)(103116003)(6512007)(5660300002)(38350700002)(8676002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Io7RTvok8rcgZJ+dCzJ44rXCw3l67GJYEJ5gyv3+iyu6IsQJPEy75Cxkph5v?=
 =?us-ascii?Q?jCOL8oAIsB+uB77JJPeYhDpa0dJ36Zi88bu6B3Zmjde3N8/9o7mbSuMzi8th?=
 =?us-ascii?Q?q88i3xr+b7RGQimSeX4fC/BR2Rqe5NRGAb+IIWcZrsDG9VuPm4b4hps1+ObM?=
 =?us-ascii?Q?0VfQbjTW+X39WIVShGIHy0PEYmt2ZJqStEKebtv7xBiq7LX0x6GyIhzOekrw?=
 =?us-ascii?Q?gSF1meHV3g5lX0rUJiF7NiRRtosMoLtjBxUwFvj2Mk3UjH7JuH1LCPVnL2fV?=
 =?us-ascii?Q?DhQMRWl3gYWSgc61hGW7LBWiJ4jCWOEXj2lYxLZjJNlSoj5gFlybqKsxkfDK?=
 =?us-ascii?Q?H/RIqjCJPDYV1xexLleuouSojJ47hO7LRuphrSYBEI1VK47v5IprLq3/y5PX?=
 =?us-ascii?Q?dC+s4nFKEY66fP0F6xqX9ySMbN6BpBFqehaEfWPor9Rpt6FEZNuVLZHR9RsQ?=
 =?us-ascii?Q?vt1BfQlmgVvcWByJ9mprRCL1aKTc8bpzxSip9AXXZN4Od08Q16cZjn7+rSBS?=
 =?us-ascii?Q?jBr9PluvrHGqbi3iBr1I9v73y2ezijRvSDD+MFL1jla7QTFxbJ+8K7CE52kl?=
 =?us-ascii?Q?9Qu2T2iPhsjQ4pF/19xaTBXzfLt9xQ3ISS8kOFWpot04KN2XXDneMOMz+fQE?=
 =?us-ascii?Q?iBjssqUj7bg6zB02xIGwJXvbcAMF26LVBiJWW3sRVEArE4bxma8tRcwFTG/o?=
 =?us-ascii?Q?B2bgbuiASLSoVH3A4CQJJngV4lN3pQzJ30oa9tFHtn00PPQhXr+knzgdSj+6?=
 =?us-ascii?Q?7dYCXskcYFKYtAQabBtLCf+RRznA2KxCPhcyMd8YNyfrnE4FSKRKFOoy0WeF?=
 =?us-ascii?Q?0VRBFn3YceGbnTXxFTAXrfwdFHD8oxEi5+eAO3oWOlX3hA3u0gPQcYlOnCr2?=
 =?us-ascii?Q?LO5kTSV+fMoQZiccEcyGXqMKQKTiFItKRECDYII4n0GkJLkXraB60y6btSoo?=
 =?us-ascii?Q?hDn2Jvc3Em45+p/Cr5xcfcomqGIAiv/uKqOgWyg+h2GpcqyquO8kOL7gDuEW?=
 =?us-ascii?Q?PqR3hWdR2aBNyPYuuwT0zt+I+eUzfbs8qKLvPWuGkBSX8MA7PtCGys9R9org?=
 =?us-ascii?Q?HbCbqIfHBB6xxaKdV00fwqHBSh/GTqpbjwtXqWSzVg7J+4dvz5aGxH2sskac?=
 =?us-ascii?Q?kcTMeDyXaPw7ey+YzsRSTf41fqrC/DuBaWpxzEG08vRc69XkzItKS0abDa15?=
 =?us-ascii?Q?9mnCQzrTYI9Z22YG2Yi2y3Eill0bPmR88Lkjyxufaj0FxZsw6l+8syuJTGiI?=
 =?us-ascii?Q?BSdggCbUVkr20FjnXNQ4scFZ731DCZeoeWFjjYdRJnEtFq4rlyno/n8e+F31?=
 =?us-ascii?Q?FTKBsQwzm9QrfB/GuWTNBc0B?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8d039e6-cd67-473c-0ee5-08d93cc8458f
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB3892.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2021 19:41:51.1033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GqZ1haq67o5WYx3HsOHgaHOxCRELpEzVIRar+6fsY+b5Qd2CLn52uq2zT3tpRyvnrooat62JTxjvKq9DY1JEpiMKyPd2bm8kltXACi1pmYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4021
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

A common clock framework device driver for the Renesas 8T49N241 universal
frequency translator.

Alex Helms (2):
  dt-bindings: Add binding for Renesas 8T49N241
  clk: Add ccf driver for Renesas 8T49N241

 .../bindings/clock/renesas,8t49n241.yaml      | 183 ++++
 MAINTAINERS                                   |   7 +
 drivers/clk/Kconfig                           |  21 +
 drivers/clk/renesas/8t49n24x-core.c           | 836 ++++++++++++++++++
 drivers/clk/renesas/8t49n24x-core.h           | 251 ++++++
 drivers/clk/renesas/8t49n24x.c                | 573 ++++++++++++
 drivers/clk/renesas/Makefile                  |   4 +
 7 files changed, 1875 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml
 create mode 100644 drivers/clk/renesas/8t49n24x-core.c
 create mode 100644 drivers/clk/renesas/8t49n24x-core.h
 create mode 100644 drivers/clk/renesas/8t49n24x.c

-- 
2.30.2

