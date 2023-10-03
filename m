Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C11627B5EB9
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Oct 2023 03:35:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229926AbjJCBfr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Oct 2023 21:35:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229875AbjJCBfq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Oct 2023 21:35:46 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2120.outbound.protection.outlook.com [40.107.113.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E516AC4
        for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Oct 2023 18:35:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V1M3MKFgqa2cUbbBGngXT+yRuMsVR4Xhkkp0YX1rsEe/w35ahfawh05GzNuQRQvQTWQ8xlx0FbIG/2nlQxgImYiQxtNt5VWEaS6QQbxQpf5o5kqzFqVc6Io5tA2J3UMOv3/k8xB0JOOx9FkWv9FuVNZRjfKT5jhxYVba2GOHGvmHQj4qf9LZzNIzB0Hn51xlNbWbvdB1My+q25CuLEtbl3JbmOd2/PnFyqDSo2HA61z6giWyI+Yq1HDsXk/2eSyjZ1T517IHC12RiMHvs57MQF9Mcqlat7BLRc/P3eVG4GqG+6rwRb/ePtjJq1thZtQ62rdXsMmxLVSb2i9pCda9Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YxTZC17sO0NVOcVXHSNM5Oul75GYUNDHKgNCBItL27U=;
 b=WdWD32+8feVyQ7LUsDiX+tSjSSgBQaJCCfWIpu0Rw6jb/vYezBRJt1K2uWb341rWFrNH+KwMXf5Ktcg4CKLX5QxZ6B9Ih99vgu9W1CcI4VCDZxjJjiALtoLFnJ4gXZvUI75ww8GEgbNbmAGVwjDJ4thYLrFmm3yo11ZJelrQKZQM735OqOFT7bfGiAp+S70PJvIOnuGIlmDXAtbZDkWVbi72CUvdDmMAdvpf3YmkYupog7pFiqE56bXGxZcAxPVbHXxBHHcv1Mp+pV3JsYh8WAxct6W54Vbg+xg5d1BIaJmDhm3fvzOrlGhAq501PIfEHvYqAB0PNvPvfT9roJv/QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YxTZC17sO0NVOcVXHSNM5Oul75GYUNDHKgNCBItL27U=;
 b=KSzi5x0uSiMPe2Qxr/hk/y96qcMvhZnbyPzPLmCpkSq6JskSI3Xh+DqdIaCERut2PfZXIcX7PTab6VMc5vvn60RujUGxyDBG2pcWsszV0mRaNAE+mrojKto47FxOZfc1+zUinmifLPMN8NhQQPI0eFwQQjp0MdSLNJ2LumnLfH0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB10169.jpnprd01.prod.outlook.com (2603:1096:604:1e4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Tue, 3 Oct
 2023 01:35:38 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6838.033; Tue, 3 Oct 2023
 01:35:38 +0000
Message-ID: <87y1gkfpxy.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Dege <michael.dege@renesas.com>,
        Yusuke Goda <yusuke.goda.sx@renesas.com>,
        Tam Nguyen <tam.nguyen.xa@renesas.com>,
        Hai Pham <hai.pham.ud@renesas.com>
Subject: Re: [PATCH v3 4/4] arm64: dts: renesas: Add R-Car S4 Starter Kit support
In-Reply-To: <c47926f1-8a79-42b9-a497-95ec43e0d2ec@kernel.org>
References: <87fs2tefhj.wl-kuninori.morimoto.gx@renesas.com>
        <87a5t1efek.wl-kuninori.morimoto.gx@renesas.com>
        <c47926f1-8a79-42b9-a497-95ec43e0d2ec@kernel.org>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 3 Oct 2023 01:35:38 +0000
X-ClientProxiedBy: TYCP286CA0341.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::9) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB10169:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d4df6eb-9ea8-48b3-b2f3-08dbc3b10c2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jribg/0KGeHM8Q+TnTkVhb5JJwgHlUNzONFnLaUbUVee5TPHJd7Od/k/GsJiyc94kQEHMKp8gEoeYIIMGahkBj7pIbV8tIddhhU94aV12nts1F54flTaqiP2xgwwQiiPx2FhPUudlY3aAVdBrD1vsQLI20PD+w14Ns8dmfYylD/yOCbfvPePhLqaL5SLoXWV1FvLkNnPVMTgz04efsX8ZivfdAaq1qe/o604cEY/mrKytOl7E44Wl/V7V8kPb1d29A5Z/IWK+8TLc4eWQw6q7YS3pAv7yx0K3X8X1aqRPX4f0tp30phyCRaPLsgIgqUWQ5NzYoefYF4baMO0AmlNv2jg+9zOVimpPV0KYswmCyiBcgx5brh6X5Xx7/P8mMw1qO0I0/wLt1nSRP9JpMmRd7VhP8u4DpK6kMeEheh/w36zMKbsGARD5A6o5MFMEDaHE3DeS070KqmTDPFiNgZvHSwDj9clILOGnr05Y9UEb0osDyfByJprl8jhRRYFWbKqto6ufriX4VUUM2rF1PD+T2XuhFG6FQW36lbchfnw8qHhf9sU8bC+1P/5T2uVIaLNEx8ncwJGG0ulu8yt+5qAPhCDgCk/3o6rCBlvhQlc34rNW84pMHmJ8gWlJd8n8CrL
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(136003)(396003)(366004)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(478600001)(6486002)(107886003)(26005)(52116002)(6512007)(6506007)(4744005)(2906002)(86362001)(4326008)(5660300002)(8936002)(8676002)(38100700002)(38350700002)(316002)(54906003)(36756003)(66476007)(66946007)(66556008)(41300700001)(6916009)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OvMxuSA6CpZqj5epMfrGkOgIaBeRtP9aJxCLt7VqLP0CP/JkEhhNE9W/Hah6?=
 =?us-ascii?Q?DjvoJ/hkPeHTm/jpc0s22vxGnn2BEvKr4vQOxkipLyz4MxyTmR3qWi9Q3Uqe?=
 =?us-ascii?Q?Ly3nw9AfNvNg8Fiofi369OphmH9eEEUtRZ+WVw1aAjUEVk2J9iZA9VEY/T3e?=
 =?us-ascii?Q?ph8AdJFJ6AxMLWMz8kEHgkZTtht0vNNJKi7WIDIgX3itqm7Yqewk2uCF+0xQ?=
 =?us-ascii?Q?Hzs+WEeEuc+AI3qTygBxCs1ykzURW+rU9e7BTqgQVV/4ytfJ+swXMxx4ymOj?=
 =?us-ascii?Q?YOZh+z4Dehxrh1jWPYGHBY7cXID7z4DHwycs4CEoiaoX2vwIeyZNUsM/Kjsa?=
 =?us-ascii?Q?S3oDShKeLmL4fVzTsFODzb7cDr0iU7PZTzL5jSofhiIpANaTf0PZBGe7x+FV?=
 =?us-ascii?Q?pBBwQodZPo9Op1UZUTlnDAnqQcm6IEWEDlsw/sDcFGfGYVBa1xr8lUVpc++F?=
 =?us-ascii?Q?O5bax7rFDNOJYlzSxZcKdK+33Gi2RQtCXkrfoK/xba8TrQFcWTAwJ0z5gr/v?=
 =?us-ascii?Q?KlP6adKhlVWjVroyH3v1RsIdc/vn2YPyit61iT7vyHG4yLtCQ1uRpCtmg6yW?=
 =?us-ascii?Q?0ElKEOzhI3EOsFfq9KmSQ4CpWWMPLe4IaNqFI1XI7VQNGR0Z39+KlG0MEc18?=
 =?us-ascii?Q?12CTRnujnpZMWPbjdpkHaIoxxjgUuq3CRx4tmz+D1HGKaQj7YU3rEJjG9H3S?=
 =?us-ascii?Q?+PcqcbyVsgwLzfTibKBYGT76fdjdJoptJnbzr+OQEbdKi8dQs16CnvaXm65+?=
 =?us-ascii?Q?kGEiRxXnlGmZmZUHKxh1+GI1jJTvQlVBilIlAztj8niE6IpDcqIf1zy4v3dA?=
 =?us-ascii?Q?QKLeLIxOj+1Ybz+w8CefVxCA9E9VjVuLv1zL9mntD+K9BGEK7OgX7BF66s79?=
 =?us-ascii?Q?IqOxSFGum5Sfs5iWdWlDtxcAGBFuOwtcb6nyVaSYyUaHX1qbmwknHx8xt/hN?=
 =?us-ascii?Q?a6g2Two8d/UI7+xrWLELtU1WvOaBwFEDiMLTtDa8+6bjwzMZIH7rh44/l8EY?=
 =?us-ascii?Q?45SX9PKHqyqv3Vr8VQE5FQr9ICUq2shW5Wa1PR+vDKnlxjkMEwIzhwyZvA+J?=
 =?us-ascii?Q?jNHxU2le+KIEO7ePd6whrkg8r5DSx45OT0pzAxGWBSwjz/6HlN23U1j+D8Re?=
 =?us-ascii?Q?0NbPyV3Q0aI9+mAwuGWEprPST1RlNnTlE5skpZAF3um2WkJxUlOeafgNS3qc?=
 =?us-ascii?Q?Y1xjoZwttpo4G6yw7omkwMMz3Rn7oJ2f1PLD4Nzcq9L5wfR1Qc3uy6zqH8KW?=
 =?us-ascii?Q?qj3UoCzu2TXATps2bBQmy6DBCWevlQsIwOyVZqLLXaS2Q4C6mbrLhqY8QXaj?=
 =?us-ascii?Q?eJTwDOvo+Z5FEv/OZY2sNDHLtOaHIKJQlbwPPIWRWCtm4rb8lrNYZmaz9P/Y?=
 =?us-ascii?Q?ruw37CrzByEAy7uTNBJICRBwvmO6zLbygY1iEjvmmcFD7iLlRLf6MxsHRYTC?=
 =?us-ascii?Q?BbIKHD3w3OhnXAXXubYDSLUeBKtExyQiC3bwK3w4QfBvvV44/CXgJb9khLak?=
 =?us-ascii?Q?8MLsoEFRx0uuNteid015W4gLBntqO0YPTslePcoGfwUZz6fC5K7Wdk6hvRvs?=
 =?us-ascii?Q?jrHbsvb6sYXbZfyVOzqgf+n7yi6NIO0XP3EeyRG0EPymSWMkXMPLKqCdU7cX?=
 =?us-ascii?Q?oQ+zZTf2v4FoERMzmKBLrQU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d4df6eb-9ea8-48b3-b2f3-08dbc3b10c2c
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2023 01:35:38.5040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eq+aN6h19OzCvViSzrXJc2+1GXvLo4TErS5sHmrtvnvjs2SdFaSYIQ80WLYMx8rRt2Ye6PYX0F+NxHJpUlA6xj4ZefcjF1zG/6AL65zFVndCt2WWccPEi40gm2nA653O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10169
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Hi Krzysztof

> > +	chosen {
> > +		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
> 
> This does not look really hardware-independent and suitable for entire
> community, but rather like your personal setup. Please drop entire
> bootargs or share why this is needed for every user in the world of
> mainline kernel.

Renesas DTs are traditionally assuming boot from NFS.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
