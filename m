Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 969B5783998
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Aug 2023 07:57:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232568AbjHVF5q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Aug 2023 01:57:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231316AbjHVF5q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Aug 2023 01:57:46 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2109.outbound.protection.outlook.com [40.107.113.109])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2C35116
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Aug 2023 22:57:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ik9INjYTJH2IBgtkSnufJDoLpeLrix8XmdnvnjvjCikkok/AUAxx+GyHOccD/LeklGANIRcWh8Krz8gkTeCkaEISnDXX6aFDylTjmcxOkIQxQw8D+iCnqfShwuaHdDjKJ5LJMzCaJnqAbVRWW1vQvGedg69yVNC/AudzO5xsFFKl4inJxnzGYyFLM5xUqUPfdcc5RpXnfMJm7rKncR7TQdJ66c9iEqXqf5uMJpuCB3BOP9c6ixmVG5d8FbZw+SuZfphPAZywQgjZQZfv7vsa6xURaGRvVGUH5yonf2J1RIBENU80q6xLkIzrFtMfFjDZlK52M/H5Swc0wlyQVcFmzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q1Log8f+LwFGXmp6pyJ21myMEubPILzz0bOOqHSnRoQ=;
 b=Vq0KAb6fJPjiP3XBFd5mgIGJmEbaFgSOEAJL2rKfYrdJTibe9AdjXZBhlvxEUwpU9d8O96CWwqL6OnZU6wfobSMW/lUf/aK9SfG4gbgRDReNnKbgV2Olm5C5TsvWUweZaLCd8gi/qy0PiMOTu3iOzvG/F9yzxV5a3NsqA8yTyNbkzyoZRm8999kju7PD5cqbDUrNXOerluBPqUfqTi6TLuXa7awZClQgN6w304kcyTv0hEvyiiFfoFcN3iohVE/Vy8ba73vI7zoUXfdIjRFNs4wLmJ4OdVRO57+C9GSzvNKQFzuehQqrrKQMtBJoqgrl/ZZgPwVrOjDX1q4LnQcPeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q1Log8f+LwFGXmp6pyJ21myMEubPILzz0bOOqHSnRoQ=;
 b=f6D6lSEKbzTK/ck8JKW48RiyAubCPtM1zVYyzuO0f9+ahGDnNBgbuo0rn0oFuMydubqP4U0hKU5gaXVgKea/yZCU/juXA+7NC3O4NPhnqNHGJBEuxwNWp/xXcQWqV32GjLG0hUG/VFm6qrdFtmByAeAO1+mul0KYYogSIcHFZT8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11746.jpnprd01.prod.outlook.com (2603:1096:400:404::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 05:57:39 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%5]) with mapi id 15.20.6699.025; Tue, 22 Aug 2023
 05:57:39 +0000
Message-ID: <87zg2jsjot.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 00/15] arm64: dts: renesas: handles ADG bit for sound clk_i
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 22 Aug 2023 05:57:38 +0000
X-ClientProxiedBy: TY2PR04CA0023.apcprd04.prod.outlook.com
 (2603:1096:404:f6::35) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11746:EE_
X-MS-Office365-Filtering-Correlation-Id: c35ab5c5-dc3e-4bbf-ed2a-08dba2d4b102
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bdfSIx0CeGjTE0iD5i9eWbLAQIsSd9B5q42o9artVK8jpbzTVTohT8OUe0853PNztEdWu1UrhIcwNXIJFxp92xiGDiJIsK8sTp3AHKuezbRn0gA6lxpxZ3x4L2AI+H8yi995dNag9mUSroggQ8rWhG2sDjhHTZdv11BCh1S3P8QAPXm1aYyX+YjPz7dASfzz4Ju5sl8fH8tBForxjX3T+Rh2Jn+A165XSooYaYfyaeRV7Ua5oSw7zmUBAKbPS5fMZvP1foJYzRDb1F4tNywZgtgk8tE8pHkenqC5istxH0Iro3seJUVAbd1CGFjgyMRa/Jf5gN/qjM0Og0dzefX9qq44JLZzyDedhEA3V8uygzoPdHDsSJhgIEtpd9lykI4ZrzwETPZNCm1H08CaIdvJHIa8ulArSohCdjCZYAMtdrxwY9KMTm13gcOtoHDaKd8HSF1ydKqqgeYZiNXXrNTbM7EUc6V/aiq1gkd2tm8IEVWjwYheAvlS5QNm6lg+pKAwFMFosuwB220KtHD3jvMi9Ckh+vHaTh0qT35NV3irYItO6hJWv5F7IGqIN4iq51TYJaMov1izRACQWgAlJVMjFKVWtC7EUBkF6Y9WmX0kNbilctCbXcyTPVLgYuuhSm1V
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(396003)(366004)(346002)(376002)(186009)(1800799009)(451199024)(66476007)(66556008)(316002)(6512007)(66946007)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(478600001)(38100700002)(52116002)(38350700002)(6506007)(6486002)(83380400001)(2906002)(86362001)(5660300002)(26005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BZjmk9klRUBek9tiFP7Q3tkGsN9HdPTpqXiWMn/ntDhu32nm6QV/2Mp+oDGS?=
 =?us-ascii?Q?xJ2Y+r3SY1yoTggyM0DOCXy8dTvuoWpZ9cYrNwAyhQ7BASY9S4zMSzUUX9Fb?=
 =?us-ascii?Q?xuwPRQoWAyO0Nkoa7Jtf7MFNPiP9w4NebVIcbQCE2aeBUyDtUW9PvvIpnP4a?=
 =?us-ascii?Q?UfPn2MEoQ0aLqoVRgCCA1Se+DviUoe5U4hAQKg80nz1/U8ny4mPJ4En6t9vX?=
 =?us-ascii?Q?o2VXo7WWQzV2KMNPKzhCYA2pI83H1pFHGUxJoTCshc067RgUoRR09qfs1Pyr?=
 =?us-ascii?Q?yB+shTWtIj0VFg43NgnSrCNbD6W22fuCsl9k5v7olil6c2htrHyaZa/twfdc?=
 =?us-ascii?Q?B2jSRpwH4SFapqtFOnxKsUqe3V8wepkp0dO3pXipFTeIrZP/e4zGMWYfgmFk?=
 =?us-ascii?Q?KnigeUYz7O6GPzQJYtlpbuVxOIM9aAzYfxVA1nhFQbcRV1vIMKi2dfATcc4R?=
 =?us-ascii?Q?2mqCX4ocAtAUVc7k8GNKLxw0sp+oA/9rFn26n0TZMDZYbcyy4nWsaAFBQbHY?=
 =?us-ascii?Q?hZewe4bfO0VvhUahbD5bnb2ZZZyIIEVT6i/fAddg53iy8yEa4Si75sIL83DX?=
 =?us-ascii?Q?cJ04GSKs8hI2JEkpNfGOWuJfaQ3v0D9ujYLAjl//7NXYWX7uUeJM0IhGXHWO?=
 =?us-ascii?Q?pnwPfOkLysSr9ojk+7rjXrD5nIsuWYH3QqkPNld/E5k7JM0s0KYDlgELWw1Q?=
 =?us-ascii?Q?SPpa12m+1Eo83NsIsbynpzdtAfK1SNETx88duYwDYomY7ITaOjlj99NyfGc0?=
 =?us-ascii?Q?1ZtKjH6Qsm6hpvJdVCNp4vP/BLbL2apfdVIUxd8/6pzjRSrK6IZet14gCyb4?=
 =?us-ascii?Q?yPAQPmfgV2eZPXJrjQIaV+NJdsF9TSkOxnKlKYe9ET9djmJuXJlyOBUI+wRR?=
 =?us-ascii?Q?PaoSoVMGJE2waK6PKTgIGTg8OIwndcqVb+rE7aUJBGdsvo5umWNrMKTGp8/Y?=
 =?us-ascii?Q?XAOVoeBiACXIyzPS6IvbJ+7Q7IcfEp5bEV1m+YJx6ESarIB+T51v2aLTJQRG?=
 =?us-ascii?Q?mLnZCE1+hN2cQADkkMFQj1h5lwtYhZjdDEGcn6iTo8wkamgiuQW4UMWDswXe?=
 =?us-ascii?Q?NSvywlZnN7LLSkQ7R7av+bkCLP+5JFmc+hOJR4aHogGA7AWhOasgCPzk/Rvn?=
 =?us-ascii?Q?CJ7aJdgqtBGcPTaXiAqR8dewcwZZe1OGDh7LIlBnMbjPNDR5kL3ab3Ro3DE4?=
 =?us-ascii?Q?PrU6gKHu9q6/PGKHb8lsVu2rHU1UJczHlayZNxhavAOBSJmugo94kesIQ149?=
 =?us-ascii?Q?8D1VibM1Bo+ln9/Bh6neLhFNhLtHkaO4SqJUg3tNGvGWKkJw8psMW+7kwHCT?=
 =?us-ascii?Q?TZaptNtQ06LXOCYEFdz7fmPDD9Ox08WE1/rn1dpEHEUTomuG/4pDkCNrKaSC?=
 =?us-ascii?Q?KiMvh9GlXnumXxV6UJVnwyrCYYkQA2hb29Bn5tiwD1lakhyAD1MkJZSZqszm?=
 =?us-ascii?Q?QDhzBW5tJZkdbpXhTxceFfaKlE53VdAkKC/8cCpj1bJS9crLWv44+n4oy1nA?=
 =?us-ascii?Q?rtbOR5rq2ub+OPc+jxpopAWc920tvv03et0TUNyaRjBLz0qvMopwFxpKunKN?=
 =?us-ascii?Q?Zblor/UpC5bqAuRG52cRmPNDmSe4ewHZVE51n+LHh6a+un7xInpqslJzJ49o?=
 =?us-ascii?Q?SaQqWltt1XMFBcO+AC1/WsM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c35ab5c5-dc3e-4bbf-ed2a-08dba2d4b102
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 05:57:39.0887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cjtYLwE9Zgg949Ek2edmdSvyT193E1Sb6Ij2O/hTgsFaQnM0XOhqa/LAV2yjYeDCQnebEUHu4/Wg249/tV0z0lcsSQxG1w1n9GVRD4mLn9cg66YdR6gYpcdKq+UUAU3I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11746
X-Spam-Status: No, score=0.9 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Hi Geert

Renesas Sound has been using CPG_AUDIO_CLK_I on CPG_CORE for clock,
but it is was wrong, it should use CPG_MOD.

This patch-set switches to use it.
It is based on renesas-clk-for-v6.6-tag2 tag.

Kuninori Morimoto (15):
  arm64: dts: renesas: r8a774a1: handles ADG bit for sound clk_i
  arm64: dts: renesas: r8a774b1: handles ADG bit for sound clk_i
  arm64: dts: renesas: r8a774c0: handles ADG bit for sound clk_i
  arm64: dts: renesas: r8a774e1: handles ADG bit for sound clk_i
  arm64: dts: renesas: r8a77951: handles ADG bit for sound clk_i
  arm64: dts: renesas: r8a77960: handles ADG bit for sound clk_i
  arm64: dts: renesas: r8a77961: handles ADG bit for sound clk_i
  arm64: dts: renesas: r8a77965: handles ADG bit for sound clk_i
  arm64: dts: renesas: r8a77990: handles ADG bit for sound clk_i
  arm64: dts: renesas: r8a77995: handles ADG bit for sound clk_i
  arm64: dts: renesas: ulcb: handles ADG bit for sound clk_i
  arm64: dts: renesas: hihope-rev4: handles ADG bit for sound clk_i
  arm64: dts: renesas: salvator-common: handles ADG bit for sound clk_i
  arm64: dts: renesas: beacon-renesom-baseboard: handles ADG bit for sound clk_i
  arm64: dts: renesas: remove CPG_AUDIO_CLK_I

 arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/hihope-rev4.dtsi              | 2 +-
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi                 | 4 +---
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi                 | 4 +---
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi                 | 2 +-
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi                 | 4 +---
 arch/arm64/boot/dts/renesas/r8a77951.dtsi                 | 4 +---
 arch/arm64/boot/dts/renesas/r8a77960.dtsi                 | 4 +---
 arch/arm64/boot/dts/renesas/r8a77961.dtsi                 | 4 +---
 arch/arm64/boot/dts/renesas/r8a77965.dtsi                 | 4 +---
 arch/arm64/boot/dts/renesas/r8a77990.dtsi                 | 2 +-
 arch/arm64/boot/dts/renesas/r8a77995.dtsi                 | 2 +-
 arch/arm64/boot/dts/renesas/salvator-common.dtsi          | 2 +-
 arch/arm64/boot/dts/renesas/ulcb.dtsi                     | 2 +-
 14 files changed, 14 insertions(+), 28 deletions(-)

-- 
2.25.1

