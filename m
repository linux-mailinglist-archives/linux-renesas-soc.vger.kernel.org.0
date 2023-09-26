Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C7797AE496
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Sep 2023 06:36:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232910AbjIZEgb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Sep 2023 00:36:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230184AbjIZEgb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Sep 2023 00:36:31 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2107.outbound.protection.outlook.com [40.107.113.107])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C024097
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Sep 2023 21:36:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nIkIzy0AI0wyo2jYMxbSvdGcQUzls4WYhGkYxyWV9lhSUDWmNiHuKH81BTlyN0E7RV5W5MqrKl6fDVfNUNy+dBs237aJ3TfrGddurWh9kw1frGTpNE+Y0gQ06w08LLrZzHi5YLrNzFOdJmG2b/fS5slmjiHSz6MtDz0nWVqq6RVO8Q9+yktnjc/I1x+nHceuiP9Se+LMbSeh0C6ZUilUWkJ9Ot7+zCmWlrkrs4GcYCg5U2XDexnAsp3qTWHE+Llkf6hpY8aH7hAX7ngn7S+NGpO30WmLm67slDsmqdSjleYYGrdtmsC/wanNMUbzOp2DB9HSh0/ZQqYjiQ3G8cYrCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=38VuThGNanha1gKxl4bR5FRihF6E5leGcuHfJVZI1Hc=;
 b=Q2ULsZIn95tLUL2QQikRgyt0lELG2PpejP2AEgrw+F1Ns9iT9xnlS20b1XU6D+SGBaiDJTPqvSFnD+zU4xeggjj/d/I0MkytUsPdrssY9YS85y073jUVkg1L6JHjXN1JFb8a4WxkDsfkp3Ph227cBYIL5BVQDywbtdhUnL4y+vBfm5Kco0yVBUT9GkDIqOqTJUEXxAh3yN9mih4geUjBBZqLErxJLUWVQl7TfkQudkz4E82ykA2ISMug3fWfmovTE6MhDVj4pcQf52+GVkmqBcQl9INn7rjotDuX74J+LzKREip3bKqUZlD/ky4weoLkUJe0z4e+YYjxlhiKwcnZvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38VuThGNanha1gKxl4bR5FRihF6E5leGcuHfJVZI1Hc=;
 b=eJrTue3FuhCl0zAXoiLoDGcPcqV2KMJD/t2NXZ5oL8/l5qFPxzefL2E7VGZ7VwK+zajuQPlaJ2xQxS4n4mJWk6ZHnnULjWKPTwTlZy8vZjyw3I0pR7TO8QQRsC+UfSy2fCKxurBwk6E3O07EJW3QvAs2Bn8k5/fE5mueawrsR5A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYVPR01MB11247.jpnprd01.prod.outlook.com (2603:1096:400:364::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 04:36:20 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 04:36:19 +0000
Message-ID: <87pm25im9q.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 0/4] arm64: dts: renesas: Add R-Car S4 Starter Kit support
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Dege <michael.dege@renesas.com>,
        Yusuke Goda <yusuke.goda.sx@renesas.com>,
        Tam Nguyen <tam.nguyen.xa@renesas.com>,
        Hai Pham <hai.pham.ud@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 26 Sep 2023 04:36:18 +0000
X-ClientProxiedBy: TYBP286CA0031.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYVPR01MB11247:EE_
X-MS-Office365-Filtering-Correlation-Id: 732346ac-e96d-40f2-9f53-08dbbe4a20d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DE89g8KAR3r9z2W4K41edP7XIYiJlQcAvdCDa62g4xBTR6h2HZfTWcSinTX2FNhYlxzQGs2eXK81jxZkCHAzH/S+LTIK/wvCXZZJmy3FIVLNav3Y40fRZCMlbdmmKyhfNaB/FnuahYVdvr6LNVpa3jyrYF2wAMta1IoirVxQ/A56uzIl8WzjlIun+ThatHDAQGbmr7wb3VPYhBj4Hjhw+1rE649f6BqK3S8Jo8Z0H9Q1sLJYBbKQROpnLNA/NPJK69V5/s+oi9BZ6+ztWWtEDwIddqTDzxNPKp5mxsGfEB8JCOVXWQcoO7C08ONYlUcP0oK2kBwzlMeyC8nuerfyzzM1k4UJpwJvhlHceXh8IyG4mTumixQF8aCIyI5YbWYXj9d33n+fBIzum+rGkz3/AoyRbz95pjUf/LgiTh5ZbJTLX32qRde2ggWcduI3EODKHqJh4E1KpEC5cpD8dHHT1QZDNkAwmJL0ZrxHl6xAKUdyaIKNsVtiiU0RtmDT2aeSOSRURf7jYQa+9qP64PGTtzQu5Z4AWkY46XBUkiJZ6bcqpkeEk2lWPGohTj5oBXMFvs4f8Jy7d7HMfW85xW+QLLhDMFXY9YahMCrESYHcWYE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(366004)(39860400002)(376002)(396003)(230922051799003)(1800799009)(186009)(451199024)(6506007)(6512007)(52116002)(26005)(86362001)(107886003)(966005)(66946007)(66556008)(66476007)(6486002)(478600001)(38100700002)(38350700002)(83380400001)(54906003)(2906002)(5660300002)(8676002)(36756003)(8936002)(2616005)(4326008)(316002)(41300700001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DutVVmHT3PufJqlQ+f4N7xn257aWK2gszTYGyKzvHBegyiRa1eMM5D/R6C5L?=
 =?us-ascii?Q?vMQT55B70PDnqpHIvm1Pv0ekHjas60OsM5T9aJdKwMowNbbZ2O93wrZS2ccw?=
 =?us-ascii?Q?jXzcmPjqFhP4qC5uhkqNC9lU8u8mmjSOWUG+KfGYZTfiaYz8JQy67U7JO036?=
 =?us-ascii?Q?vsT6NLftKvb26HNG6Tj7ITDi1wJZHbjL3I2c1TZAjS3JhUs4714YoP852IwY?=
 =?us-ascii?Q?Vz22Vgt9ak1CBZ0fOjGQG3lJpPCbtM8sYWCvpudBMJbaw5dOBQ0k0uvXKUg0?=
 =?us-ascii?Q?dzxtYKlPODa/qGA3C9wUEPrenQiTIYZ7/34coEv4Z/PULOmZLS8aTYk6ukUt?=
 =?us-ascii?Q?P651e/p8Vo4lOHnNJRTfMcmgRrkvrAIv/uud5QILbpJpMm7Il6PtVoWCQ4H5?=
 =?us-ascii?Q?oK+TjNtm90WxpX3KJrHynxTSJjQHhBx1afmE5+dw4gxRfbXItVI1qG8oyLPp?=
 =?us-ascii?Q?+FmvZ4pJ5Z0p+Hqldf+hVzQPm2MwN34vfN1Thy934WwK8P/oaxwMfV1q8SYn?=
 =?us-ascii?Q?XfP/3ZAunTIUuK/Ny3hKiW3TGKoS4ICFLdF/cyTWMivapQQplw46yXVdituc?=
 =?us-ascii?Q?TX1KG85v85jK2dMFykOLKalifbeGzip1U4JnJ43LpX1NakyjyB8KsorYmvzl?=
 =?us-ascii?Q?BaJ115kFLAJ492vfKhEsxh4qICjcnlRko09+8cuViM7OPO6JaliTAi8U/Ngo?=
 =?us-ascii?Q?yW4BXffZ/DmVoCr6QLgmOJ0As25NZmox9ElaJgjfUuVd6jJnqTnoANvr6Ms4?=
 =?us-ascii?Q?eqRNzFbhZKpclJ+ZwdPsT4hE3Rv7AL1qd36dTHWQODbt9soNqpCJj6LuLFpb?=
 =?us-ascii?Q?2Rqi0n9IOWKcr7jT9Z6sdbA5YFbBBXlrRGKNR6LqRZENMcPLW8liYjmMeCbo?=
 =?us-ascii?Q?MPAdYUU139DbjSUG15SwzPYV0PN8QuesrMfilR4x4Y+/Ju9IDV75qmaW0LFp?=
 =?us-ascii?Q?/Cliy8glr1/S285ZFN1XaisMdtac5NM5leeoxWjKdrl4Cdv8ksUY9I6HOIjO?=
 =?us-ascii?Q?qqmCx3yrPNV6/DVo7n/EVRezUOcfporMHKeLAC+NR5ue9BJuVeZO1jmAJewz?=
 =?us-ascii?Q?1TVyU4V1rHyWLXWPVV4K/WxT2a+GF1UAmp1sTtidykll63QwKeZ2TrEigl5F?=
 =?us-ascii?Q?WCflo/DIjmpJ62S30D0epEoMUAup8OD2cQzuuFiWSAxTFnz81eOtQ/taDlns?=
 =?us-ascii?Q?XzhWhWCzo6IMg3dOMQYrUusgqf2jR/JI9lLCF0hE1qwZ+Tyq38dJs2igdR2r?=
 =?us-ascii?Q?m9B1aN+gBdTt1vvEUaj6arkAMqzNHWQQ1+TiZkdXK5GXwJ87/EtMY9Rmqo4x?=
 =?us-ascii?Q?EIbk8mYeLAecsgO6jX/4tE45XnDqcx7T+3Yi+4NnIaK05xK2azbC+smwc08I?=
 =?us-ascii?Q?pbOA72hzb9ovtfgs9jejQRYOH80KZ8034K7d1VQfYFOQILgYsGFDe290zhV0?=
 =?us-ascii?Q?VuIzRGUUMJYCe+7RVqw9fpVUB43adg4uvej4/OBT6mtO7pBCvWuRUSLIFFaa?=
 =?us-ascii?Q?x5pn5CtAUZahbCiZ6DQUtzwh+w/j5yJXaTdU05rVTlaYYnN0i7CnAY3GwKrp?=
 =?us-ascii?Q?K0l1BexorEGQf5e8PO47zJStzJRRg6hwDHuLF3TTe7ot9dYDD1gB5A99vsGL?=
 =?us-ascii?Q?hW9Y2xx1LIX7CWRoNTeFKCI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 732346ac-e96d-40f2-9f53-08dbbe4a20d5
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 04:36:19.2322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pZs85+o8nKXU/r8rH7rMu2356Vv9qtWZWSTdwLe59rrRasYQM3wUlKiDpvWlKHmmox64YSiBD9s5Gi3TDaZEroF1kYRgVac/O2NrGeLj5Ugb91faiAOkTAmsVNCoyarY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB11247
X-Spam-Status: No, score=-2.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Hi Geert

This patch-set is v2 of R-Car S4 Starter Kit support.
It needs Rswitch bug fix patch [1] which was posted to Ether ML.
I hope it will be accepted for v6.6 Kernel.

[1] Link: https://lore.kernel.org/r/20230925003416.3863560-1-yoshihiro.shimoda.uh@renesas.com

S4 Starter Kit is possible to setup details via config exe,
but the DT will be more complex. This DT is assuming "default" settings
to avoid confusion.

R-Car S4 Starter Kit is using new R8A779F4 SoC which is updated version
of R8A779F0. This patch adds new r8a779f4.dtsi file but is using existing
r8a779f0.dtsi internally.

v1 -> v2
	- correct board name
	- removed BSP specific device
	- alphabetical order
	- add missing compatibles
	- add new r8a779f4.dtsi

Kuninori Morimoto (4):
  dt-bindings: irqchip: renesas,irqc: Add r8a779f0 support
  dt-bindings: soc: renesas: renesas.yaml: Add renesas,s4sk compatible
  arm64: dts: renesas: Add Renesas R8A779F4 SoC support
  arm64: dts: renesas: Add R-Car S4 Starter Kit support

 .../interrupt-controller/renesas,irqc.yaml    |   1 +
 .../bindings/soc/renesas/renesas.yaml         |   1 +
 arch/arm64/boot/dts/renesas/Makefile          |   1 +
 arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts | 243 ++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a779f4.dtsi     |  12 +
 5 files changed, 258 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779f4.dtsi

-- 
2.25.1

