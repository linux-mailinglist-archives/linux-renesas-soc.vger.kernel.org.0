Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2F047A8FE0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Sep 2023 01:35:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbjITXfM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 20 Sep 2023 19:35:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjITXfM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Sep 2023 19:35:12 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2124.outbound.protection.outlook.com [40.107.113.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9355C9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Sep 2023 16:35:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VA7lkQ7VPGNvf9SrbPsh3ve55rTO+tBFLKj5L5KdoWEl60ygzK65LJJVfBuPb/nBvDevC1VCBNB04+jx92JMwjKEaq8Z85Z6Jys7MR+UofLN4a+pTCalfNm1IpVXRHd9g8l8KmG9VyRFBZBA/OX6Sf0m89WW4/C2G80Ux0SM5XtrbzZaEOPth//7p20j1aEW+WXyh4xgJtNNDAw5jppOTXBM08M8PaX6Cb8iBoA+9Dy4ZEMiLbK4mDeTaQn5luAHWTctxB3v4mmht5ltuu37lnnC/hWglDR5YmmbQ+LSCDpl2gtJmgNO2lyofQ55bW2F341csBklaqFxcsUaw/p13A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kjyfHfwG94MJwS65atSLmxoJQtc07fKMKXXwJVsgnlk=;
 b=OpyaT2m2g68+zv+yFhrGcyEgykv9l+CniWZv/WsuHy7YEUIkGmtP/rjODO+Xlg8qaDN0b4HdLjam3NncwlAAFW0fpBEqmg193xIZDORqsLMo/cGO+gaDxPX36ZtKwbar80ZabvAvNSin/qZNH7xp95cPKWEBZKHU+qFB9fleztMNukmCFx4HSVpFRJ3qgeMIbhYWSMSX2IPH2CWsisAmd3PfLUQ17MOUfliXhcw9wFl2v+4EhtRcFxHKhWHenpFQAVg/BUcdWpuTf+e48rqZ0FT7X9tQoFZfyk6zRosphOvpegiZtYGoxVQv+mWhUdyjojvWYxB8FkBrVhNThGQRFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kjyfHfwG94MJwS65atSLmxoJQtc07fKMKXXwJVsgnlk=;
 b=km6A2EHB7Hrdwejzu22tM/vhKmTC/JbhFTn5EEl7o4973k3Y9D44iUOkvXUVo8RqAVapWGmh4pHlKf6258gzIgCib/I18tDDxLBnoDVa6rgyMF4A8PRrfYOT+YsdTIIzw4ObKTReeo1oMn0jqr/nAFBuH40ZA+BlpiQ0vgaPSKs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11595.jpnprd01.prod.outlook.com (2603:1096:400:377::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Wed, 20 Sep
 2023 23:35:01 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6813.017; Wed, 20 Sep 2023
 23:35:01 +0000
Message-ID: <87h6no2zbv.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2] arm64: dts: renesas: use multi Component for ULCB/KF
In-Reply-To: <CAMuHMdWSf1v_qt+O+-AD2d3rB6g7AyjoE0iZwfRYwVvwyK_oTQ@mail.gmail.com>
References: <87pm2dyarl.wl-kuninori.morimoto.gx@renesas.com>
        <CAMuHMdWSf1v_qt+O+-AD2d3rB6g7AyjoE0iZwfRYwVvwyK_oTQ@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Wed, 20 Sep 2023 23:35:00 +0000
X-ClientProxiedBy: TYCP301CA0001.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11595:EE_
X-MS-Office365-Filtering-Correlation-Id: 47e2310d-4b78-4bc3-6a3b-08dbba323541
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IgMyK7aN6I0jvWuQYrTkIab+4zxEPjb3SRJTvubvtRQjDLZKi2FQbz6iiCMcjbaKzwWlsuK7hmJ2sUIpCwMIE+ByDtYZHCA2L9hIgR+faeZ6yKHvN8sA31wuZIxGXYvQCWRYg8RG+yJzfWvM1hp2hIOpskvE3ELMo9Oe221GJvoz/Real8VEaC/28E5eWrtPhbfkm1WtC4fJol1cXEb72rZEnzhtcEPlike2FDXbbD0siz0AFfYVRZJoKJDUjo+fnmuAgnkx3wUsxXYKA6pAbUoyMbFUMrvoCO4tOKPXKPk/1Kue3vOkJFHrjnkgv4Yek89o9mrpxOTMeaTZ5V89kJy2nVoT6wUI0HaOmlN6csmEgy9HJgiUpm2fdnV/ERPDDyZWXFHx67RPzBuVdrt1bAk9uutZL/OA7zFUF4uHaz95slyrise/iBMG/cF4EP6scekwTrwk8XJ5g3UsLzFCHb+Urw/7X8Zdrq04qaeBgv5l2ePzdVqhHvG3f7K+IozNgYHbioFVuRt2bwbc9tJbe49MMt/A7Ro14xLvCaohPNJUvh8K5RzYl7vGdcsXhqP9sfIO72x9VYFbe6R67mo1IfAV40FBhrbxsz2kCEr/gIdXoDKwhzbYXAffVH78julH
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(366004)(39860400002)(136003)(346002)(1800799009)(451199024)(186009)(52116002)(6512007)(6506007)(478600001)(83380400001)(26005)(2616005)(2906002)(4744005)(4326008)(66476007)(8936002)(8676002)(66946007)(5660300002)(6916009)(66556008)(41300700001)(316002)(86362001)(36756003)(6486002)(38100700002)(38350700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?84R+Lb8mf1kC0hfzyXJnrdxc3gzl41gPFicmBFD9fuJ7VMoL/Ag8iSoAVeXj?=
 =?us-ascii?Q?VaFbpw42CoAiqqPHdiXCjinE/BhGHWNXBniqqnGeOgb6VA1FPj564o8dQHhZ?=
 =?us-ascii?Q?2VIEN+B520Uxekn0jmiTd8n7JH87/ma7XTLPJlphMigYGy19HRD6UA1NMfNL?=
 =?us-ascii?Q?cwlbxoXS8WaZNoNmYlnRAdEEDelMyFLY9T6YVHf25bM/VIZivlQD40Y5IT13?=
 =?us-ascii?Q?6klRLlOovnPbZ9102p6F+74kdG0mfryV9XdASpmeHPHWIoDygbjQoH2JFgRt?=
 =?us-ascii?Q?/sE76QrZw0/sya8A62QTTjFOCZ/GOz2SPqEg5kC0tsBZZIMuW0Fp5wdKLZZ0?=
 =?us-ascii?Q?OQkmPv4S+2oDYd7qMQnb22iSm/sx/vEPvXAXTz3yL6WxJ0hebQ7H0Jb3pMcx?=
 =?us-ascii?Q?7UjRRQjVz/ArkHONHOwkb0sOR8T4Hwuq6dhzjCjqe2MaeRcLu/lRH8QOV52f?=
 =?us-ascii?Q?SXAAP9PLFovjFxK9sb8UnJH6J5fEMG5yLN8WArnacRSe5xOkD/NPsccZKrrO?=
 =?us-ascii?Q?/c94dCB2jwwXrvWyKTVj4DvFov5W45sPdUhG/fa4cGG8AaY7IU/0+eaRcAJV?=
 =?us-ascii?Q?vKLc1xknNXos4bgEguPi7QoyOcCuWX5BIC18gRJvbvcFRzkkZPNB0ZSl5nXB?=
 =?us-ascii?Q?wqx75kQ2pVO/9xhNIF96LTRp54M61Sd7RWXZgHM5jADjxvHXH/Y+nwJjZ09M?=
 =?us-ascii?Q?Nurc95zS8YY0OKMMfBblWoQvdAjuuvu1wm4DCYX4h0TDBDzBuqV/E7viy2/1?=
 =?us-ascii?Q?tkSHEyLR07e8npz3ikCn9xGjjveYxUVE3XTxLEBT61wd9FqPDhngL/YH5H75?=
 =?us-ascii?Q?xLQ1fHx4mY/tLQTMpOt9IJm26lVvZdpTmmduEiNUwibcdRKI+xFUtb3aMR1J?=
 =?us-ascii?Q?XxzLT/97ExVMRWOKIpK8zbnoMPTxcBbon25/g8Q0k3uoXKjlp6poCpWcmDpB?=
 =?us-ascii?Q?zTPDuAqF9AwguoQkqh4Jd284RT938LOsrLtYcpb6rRFJOXTc/ieahy4wqd4Q?=
 =?us-ascii?Q?Ot1BrN7Rs5kOVelHHmayqd/96L1R9+wH0EcXNNMXPEf7lTlokfr2jZW8wyOi?=
 =?us-ascii?Q?S/UoELLqiCyDa6kfiiB0PQDzyuFrCsY33ntfYEsnEHazwdBqoFNzmEQJEmJN?=
 =?us-ascii?Q?Jt6ANdEskRFMqIdYW4QWiW7sSHO7kl80sR/WMBez1LMhw1dPknNoxKuecNgX?=
 =?us-ascii?Q?rSp+iF6cqdctnKNaUTxBGM1LHEKl6o6cfVZcXsTsw2K2ybXl2+Pxa8wsk/G7?=
 =?us-ascii?Q?v9OYCLWzGU+qbSp5r898ey48Te6Tu30MSCJlyoTJHqur6GtfbutALRl+dUxx?=
 =?us-ascii?Q?+CeiJn5pPJIxKJ/vqv9ulzQfmEqJucPZ2cuj9KwwSCZ1u1Luv17vBRN39cfL?=
 =?us-ascii?Q?/zbyxhdcTI/Ow8QmthulkR8zmgHmK4ILBwuHIVyjZ1d7xP39VOPASdEIWjVL?=
 =?us-ascii?Q?rrk4rwnUBQhliHIzVvIJy+vhTPkZFAFqXyuj+cd8IhKDWxFHq7RszPhxIE+j?=
 =?us-ascii?Q?bRz1OAMXr7U50e54QT7wMmemEFP6rmj9FnY35uP3zZE1CEVA6bmKMu8qEVPT?=
 =?us-ascii?Q?uYuymEFTgB03Zo6K+IRiKQBELihpt1reIPVf0KSrQLB1y+mM3dJhTVkAPcG4?=
 =?us-ascii?Q?J4le3NmmNiFI+EYofc8gSJQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47e2310d-4b78-4bc3-6a3b-08dbba323541
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 23:35:00.8945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lDvDKG98q0NGv5WxVpWCxncrDtpyBmf+Q7AdrjH58StYMwrRmuQX/RLq3hF3YwS5Wgh+RHUnT0CsEGzki03aXGs9e5PoOSf4HAfVoS94ItryGI+vLqYMTeiND9iR7R7D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11595
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Hi Geert

> It looks much better now (I hope it still works?)

I hope so :)

> > +                       ports@1 {
> > +                               reg = <1>;
> > +                               /*
> > +                               * BE
> > +                               *
> > +                               * (Y) PCM3168A-p
> > +                               */
> 
> checkpath: WARNING: Block comments should align the * on each line

Oops, will fix

> >  &rcar_sound {
> > -       rcar_sound,dai {
> > +       #address-cells = <1>;
> > +       #size-cells = <0>;
> > +
> > +       rcar_sound,dai@1 {
> > +               reg = <1>;
> 
> Can you please make a similar change for "rcar_sound,dai", i.e. use
> "rcar_sound,dai@0" and add #{address,size}-cells in the ULCB DTS files?

will fix



Thank you for your help !!

Best regards
---
Kuninori Morimoto
