Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC0436BA388
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Mar 2023 00:31:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbjCNXbS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Mar 2023 19:31:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjCNXbQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Mar 2023 19:31:16 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2116.outbound.protection.outlook.com [40.107.113.116])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4FB959832;
        Tue, 14 Mar 2023 16:31:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GJT05DvkOl22lTE55RMneRd0o2v2j9azAfjyG8YZsG4oNSH1K8LepRzE/dCJoJkxj1QfhGhZzPpQPrP9+oddmzGAGFcL44xze0Bf1MqzANvrrVEPQm+JAjQWd3rUg1RWmkDg4F38j9G6JWgkqsx0LCS0H8gTxzcMYg0PDaJTZ8mVFIjwCMnREjg5mfas9NldU8wmVeI+29kFy0+Ren4dH+gAUt2TeV7OaiFVQsmLnLD7neUmFSAbo/X0GWgzD0D/ZH5ho2aaw/QtsLKgHLfZ1XH3Vn2ugI3m/CBob7PpNlK1p8NlKKcTZvwyJ6jjAlQYXsC+nV7yFQplhlp+cNBCSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0X6oaUuU8lJj6LbYelo2/bBPaQ667OyPstxEFch1yjc=;
 b=Yu1vqhw1tgQh7LlV7w5UusLw9mfCWYn3SiPBWq2QZNrFRsJQ4iIPJe5lMx88kDboxaC+BKRAuAyXI+LndqMn+u7ckxxIK+vUSdO2UftpSWbi4P0uuNj150fInV4cvO8AYlkSaODb9dvCWJwYewocMMLprWN7rAWw2EiVaP/yMOpZ6r0BwV9qDEbrHEhZi2pfzmqbdoRSsl8r6EXyCcA2dMFr58jn1WOapvANCCbA4jqesadonKJwqcSjhHahkh6p5stTmyP4U/liYClsT/YX5DT0l33Hpi7rdIJr5Ieq/OlKzDbr5TdAK9yqCcXhnuffNfQbGQZ5rstcJbNuMFIbgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0X6oaUuU8lJj6LbYelo2/bBPaQ667OyPstxEFch1yjc=;
 b=QfqVzhupdRlhZeNwm2PE/cbNUxZJScTQXFaknYo0qAJxSZFSXUV8/aE44Io5dyA02u0nxsI7YmpYg0Wa5sWuUv1IIgafbPi4nTTqSkTrffIi6AmAU6BGd679/IYYJ+FvOgTfi0jQYEzVEXKQXcomb3pm0Syk9yPCzEZDZNQB8cE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYYPR01MB10592.jpnprd01.prod.outlook.com (2603:1096:400:30e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 23:31:11 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472%7]) with mapi id 15.20.6178.027; Tue, 14 Mar 2023
 23:31:11 +0000
Message-ID: <877cvioqps.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ASoC: dt-bindings: renesas: rsnd: Update example
In-Reply-To: <ba4ec999dc152ea1f113253e497c093b8789d414.1678790879.git.geert+renesas@glider.be>
References: <ba4ec999dc152ea1f113253e497c093b8789d414.1678790879.git.geert+renesas@glider.be>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 14 Mar 2023 23:31:11 +0000
X-ClientProxiedBy: TY2PR06CA0003.apcprd06.prod.outlook.com
 (2603:1096:404:42::15) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYYPR01MB10592:EE_
X-MS-Office365-Filtering-Correlation-Id: 20e4c255-0977-4b97-9961-08db24e43236
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /+ij4jQg4KcRlPg4pgGjtf9ocSRfo0qEFr+8l1i7YZ/L9yrk5hX2pwrpAmA5M/f2m5X7hBhqI1gGy9rpjYbINi+XBaIZTGFT395mlNIGsOcP1I0C12l2LZ6/8vyETKm9ep7FfzZ/O/fJgUr2G06mX4dw5WRMpBYwDnOhE+XimfhjpQSU6mbnJrPepXWs9PDrbVQTElUSTYxXAqtLLtu68H1CQIkoY3vmFka3XPNKhfe6VdvmAlHUjUOfVBHIDaJLp85OYCQekUysaaKogWuKf3y04FNLM/jzJzKoS+p3rU27JBXNGhIzI5eehRP/dVa2vGLQsCj9tENaRqSU47jpG/o011tIQRA7ex3NFS1mRlRIUmdxE/QdD4Ip+k5CmHyLlwSf2WFOsnVwbUxdJQieDfONfEt5nekGTxK2lsfbYuTgPP8Yfhj6BNsq2ZQowgRVITMRjKYlAlv8Xqv6zK/Cn8yGTLA45ng/xfjx1aBLhPZHHdnSPPH1XRekSl3ozusOwdUHCh1B2wGs/nVThIa6Q1os/QfsV6MCVIK2/4+p/928KyY93UO2fjXZA+PuTf/jFBlYMgkZVHh+h04ODvhyfuI/L1cHLdljJE0tYXj6gbO7SZidIqws7p8XzM3O9RLs+IoSlhLxAfrp2y4bu0ABThiwcYgMTvuYUuDHmCDSNl1fZBKZCCRq4EGmjTKx9iS/iPlStNeAFEC4sBGa0Uh4wQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(366004)(396003)(346002)(39860400002)(136003)(451199018)(52116002)(41300700001)(8936002)(5660300002)(4744005)(2906002)(15650500001)(86362001)(36756003)(38100700002)(38350700002)(66946007)(66476007)(6486002)(66556008)(8676002)(4326008)(54906003)(83380400001)(478600001)(6506007)(316002)(26005)(2616005)(186003)(6512007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sGbEwMAZTuCv2+VTKSi+Az6++d4e1e1Mw033zjGOhA9scKdOtwsqDjGEnjPL?=
 =?us-ascii?Q?PfUHdJxNg43rOY3Tm1GiGdTxuDIHssYxEpxnfGp5CqiqikMVgH/GfrjNwEYX?=
 =?us-ascii?Q?w08BwcsySufYFxta/jqv9VraeupZE1+DZoJXml51GHGAZ35J6e+drGWjxSiP?=
 =?us-ascii?Q?igxotfe8U11feDn4fN94usyetxSw544mp58z7SJnj+BvhENIX25lk4IT0zYd?=
 =?us-ascii?Q?XHHfqwOJSZU99VSTRu9O1+OMlhbLgHTyr2sa9ZxqR2F+pqPGFqih+ChbvSJf?=
 =?us-ascii?Q?Lz3V09KI/PT1l1akYHrgXbaUmMrXpplp4trJzY0lc4S/npW8KzMNSnsBldby?=
 =?us-ascii?Q?oBZFDGuQ3U6mm+Ta97hmdAh8FnazzlfRn27I96xMKcAVGJ48IoDZ6DEeOFmD?=
 =?us-ascii?Q?7S5UMB0XNFvOFWnxkNwjd2ulH7Sl+0csEtj23Jhf8zWAUvs5q26OlIslyW9J?=
 =?us-ascii?Q?D7etWDV/XsZYrKxU/LnCuIcLCqtSSR74c46phZLOu5gqy/2wJFXVhs9uRNfn?=
 =?us-ascii?Q?D8y1yGDdWBAndyVQVpHJjRGOdkSNJ4bbZdOOGdmo3of6/pHuRYUy/Rxs6r6l?=
 =?us-ascii?Q?sNsdvYPc5DHpymP4nfie0yU7TbViswtBMYDJEsFaMcpdNDNP356NCHy1t4gZ?=
 =?us-ascii?Q?FHmv2+6APud7hfC+F+sQsKPIUtstsSOn0FWRrUzrFX/xAxu591Pyf+bBPQje?=
 =?us-ascii?Q?4LOZHsIyJTekEGi2DVBo60KZx/jSY9nlSDw/0ItxEazszTnaLTYZzpi2UmuM?=
 =?us-ascii?Q?Cu2VpAc2SWFQdqKR8Y3QALdk615ax9Wu581DncXBHI+R6xNYKSS2f9zpakyw?=
 =?us-ascii?Q?+Gt+jiaSkfSSgwO9pXJDrsBpQmmV25l8L6XhQ2vmMW4135QFV6eH3KcoO/r8?=
 =?us-ascii?Q?4ekHpKG3s6Fp6H6mUB3IqZseX23pEWwNrxErRXMiCnwM/0R7mxHA9OO78N9w?=
 =?us-ascii?Q?Dg3cSOYmwEG2aYw7o9K7+T8962oaLkVJOCkYIH78mVBJFUOL9DIb5KTYCIie?=
 =?us-ascii?Q?T+vvL43loTX7nR3l9uWcshjWPq9yZKAESzO/R6hciRdmelCivXzL49uIwDzX?=
 =?us-ascii?Q?gPGTLWxfH5CpDymyq05+jHJq74f5VsQKPwLF/iQyslJp/ucP5vyKMWVHngIZ?=
 =?us-ascii?Q?ap+zfikX8q3WwDcoPCN1ZWRkDhHbbSzgk39E/6McToQoO8PfVbKO1NfeqZFL?=
 =?us-ascii?Q?L/+WqHhiA+CDK9tqe4gjDZFphQbKY3vPon6lRald9oqqNAt88kYf4ByO7E/C?=
 =?us-ascii?Q?ixQtTuydkZTYIPezs1NIpWF9eMFFs5t49h/Fn5kKOidTMeamxJRShpVq86lw?=
 =?us-ascii?Q?tznwM/aRuGP5Nm7jRY5G2EmvDJvPt78wdZdy/NtGFtR57LS9at+xvD8ymVjc?=
 =?us-ascii?Q?qqCDayAGX+RE+QL75QYWhrx00gfT/X3T/jW/yopRjm8pN3ZYd+yPiEMJxccL?=
 =?us-ascii?Q?bVFa9nlXvWfsnehPHvfW+JBH+AHs4ppodMIAdJ5dJn0ECouUqEDrMUXNCZhu?=
 =?us-ascii?Q?11Jm3ldLApJpjK6fzobwh4KCSJQ3BJRXmsNhUdvCj4/pOyZepZs86K35uYx4?=
 =?us-ascii?Q?7oq9WTHcMHrqx0hbTXIJ0J73ADogR3pElJLziFpH15bIW9Q/kVNOYZtlKrP+?=
 =?us-ascii?Q?11IYAVqSGnOfec1jHvvXhOg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20e4c255-0977-4b97-9961-08db24e43236
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 23:31:11.7420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lfZ7m+XrpQ2ZnR4jjyct0g4dI3JvcOkI7iB0tS2iipDTEpJlgI9jf3GTOPJNwf+v3z1uciG76mwNy7BF177ceF1pnw1Z8muKMEEpky8enWkuPl56DibJE6DMt/vsfuil
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB10592
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Hi


Hi Geert

> Miscellaneous updates to make the example match reality:
>   - Correct SSI resource region size,
>   - Complete half-conversion to new-style CPG/MSSR bindings,
>   - Add missing power-domains, resets, and reset-names properties,
>   - Use interrupt binding definitions instead of hardcoded numbers,
>   - Correct interrupt flags,
>   - Drop double blank line.

Thank you for the patch.
I didn't focus much effort to examples :)

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>


Thank you for your help !!

Best regards
---
Kuninori Morimoto
