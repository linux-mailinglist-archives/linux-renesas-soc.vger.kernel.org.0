Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCB06785225
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Aug 2023 09:59:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231701AbjHWH7t (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Aug 2023 03:59:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230447AbjHWH7m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Aug 2023 03:59:42 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2105.outbound.protection.outlook.com [40.107.113.105])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09F7A1BE;
        Wed, 23 Aug 2023 00:59:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iq3/NmIF80+UZSQ4OGnfUoK0ys1oID3iBgaqWZd+Oq29IBVPAVNOYljYWqvLsr/NbNL90eIfb4Ccd90wxn5NvwcZt7Y9IDpSYZWb4E6DlwNr6HeyCfGKtr1dz7rJ1reRw9UHqWS9RLAEf2+czHQjRX4cbVSkFRBY16E33seatWTLVdWJ/wqRGbWZFMedUp1WDn0y0wk0Hzd7V/Qc0uQ9oUImMNIdF9eH3clQbR/NzmpGnamLhnhHjDwEMMq/6GPGN+V/Ghk+bCFj9BheSp3ggXnpv+EKx4B3R15DdU2QFI4AXUlhm8p6itYndDOGbpH3d40AyC4iN9utMK+H8f753A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OOR3aK5ojvYccRrVWna4MHXj8zTYZMSJLvS9eZavT08=;
 b=IYKHyHib9NtN00DFfINAAcN+DMmc8rkJEoUoR/j+ctPMMkvdo2YbaGJu+XFda+Iu797mONWxN7/4UnKnAdqvVXz7nkDQxqkQoh+KMiqGZ1a8K7y9l7UdM5beTc5VCv3Aq9tm3Cvqx81exHul/3sd+uJVHP7PNboohzFoKiIaQ8GW2LsTPubroI33jQS6BVp6JZN/5BL+stTdznFS6ktkKvHAcjq3ScZ6FBU2EIHgSt18qEYlDQInBsvyYhTyR5z3AvB2wmR4VNQfzBMap0RTmrtJ9y/G52tgDc4ZrBJcKDzNEH8w3czh4F+LazXQ7oFDo6fZc0QSnBYaAq1dGIrYWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OOR3aK5ojvYccRrVWna4MHXj8zTYZMSJLvS9eZavT08=;
 b=Ohl1msQ/UvP3A46TfBINIcYD4S4SPq7ZMbexe/0VGRekklA2RFTQZcIdW/G4yFhIW9aOStXkCtfoIiH8m8QNeBvRj1eaHcY6Ie0g+auqyN5SA2+TReGCN2PDPxVB4yviUSyigULb7vhpTOsRDrQGtAZiAFhIgkec4rx39PQQbzI=
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com (2603:1096:400:47::11)
 by TY3PR01MB10143.jpnprd01.prod.outlook.com (2603:1096:400:1d8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Wed, 23 Aug
 2023 07:59:36 +0000
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::8e13:cc46:2137:9b03]) by TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::8e13:cc46:2137:9b03%6]) with mapi id 15.20.6699.025; Wed, 23 Aug 2023
 07:59:36 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3 1/4] dt-bindings: clock: versaclock3: Document
 clock-output-names
Thread-Topic: [PATCH v3 1/4] dt-bindings: clock: versaclock3: Document
 clock-output-names
Thread-Index: AQHZ0RY+xq154w2KkEK6ZwkiWOB+8K/3BW8AgACGF/A=
Date:   Wed, 23 Aug 2023 07:59:36 +0000
Message-ID: <TYCPR01MB5933518F99785AD31073CA63861CA@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <20230817142211.311366-1-biju.das.jz@bp.renesas.com>
 <20230817142211.311366-2-biju.das.jz@bp.renesas.com>
 <19fde7851bb06b7103e6221ca9b97f86.sboyd@kernel.org>
In-Reply-To: <19fde7851bb06b7103e6221ca9b97f86.sboyd@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB5933:EE_|TY3PR01MB10143:EE_
x-ms-office365-filtering-correlation-id: e9b006ba-dbc6-4104-f237-08dba3aee4ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M8rq4Q6A1ZYoCRe2scWWn/e2GMxkY4PpMao8yBhXnGD+eGu2vQYw7++lVY7VcCpLUkKSfKnz/7HcmNTmwvd62TIf+Zi8SR2TG70eFq2aRzAzdhmBT5yLnRgMf2rzMtfwTL1ULgYWdrlW/WZjjGB0TLT6QCacbqrHSLNtK1Jd+eY7gcNvtC6++ASAzJpaiB3GTarQLUVV4Li2C6PFE5N8bzzyuBRo65KqTTDM9r9yaPdWVdF6wCz3Ge4hlsyPCONmR83f+5JyK96WhXroci4GiTNvJEwptvC+wNbI5l4fuMoDAFmXnIH1uSS6G2ASFHNuN4Cyz+y3sTqCspBtBiezb0HBr8Vc/AA/iaHk5gokknfEsc1Ii2wjGQyGk5HlPxzZzUjVmuj+sFoDgvZA0R/Nhm34syiyCVLeWVnmlwOwUjGtWFJ3WYk1FE4dBGi2nJaT3QaKk99HsEPILVneF1b37t91GkQW+BwyhNup2uj3s/GcdNrHsKRHAkaWqP9U81x8laBj2BTP/Ja/vRwrYZ9P7r+ORVDodDqqEA5YKzIjTQUGYJ9orMKZ5S2NLFSAugCE3YEppHWTGrsXko9Fk9O1EpFHZPMkjbK+1TcC5VhwCP4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5933.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(136003)(396003)(39860400002)(451199024)(1800799009)(186009)(2906002)(7416002)(38070700005)(38100700002)(6506007)(83380400001)(5660300002)(26005)(33656002)(52536014)(86362001)(7696005)(8676002)(107886003)(8936002)(4326008)(966005)(316002)(9686003)(64756008)(66946007)(76116006)(54906003)(66446008)(66556008)(66476007)(110136005)(478600001)(55016003)(122000001)(71200400001)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Q61KLrnCsP26WDINMV3s0/dXXUPk0sbpIPeVatgkQpjukVz4ICNgpC135h4m?=
 =?us-ascii?Q?QZHJ4K9ntK77zTMO1R7bgTyCKDqNMfuRM9lw3CI0jnJ7FN6LIAUq5H6YnU30?=
 =?us-ascii?Q?QPMnNHbK+IDfuvKCto6cBuOc6nkVPYD7wZmTJ63pu8v9W5ttamb3GYZVm/2v?=
 =?us-ascii?Q?bVXd0eo5oevYNUVxLjYMRy/j28PfSqzBd+FJ+4mFMFOevBCBC7cJlaATqSVb?=
 =?us-ascii?Q?Nmms6/8OGPHjE/JLEt/Un7Rr/lO7K9o4lpMeoIFARx92h+yCJeWCLTVk920O?=
 =?us-ascii?Q?tIyX7MftcWBtrMOfEftD2ntdM6cKVEENfazdvWluyzihdrgMiD20Tw9Gkunu?=
 =?us-ascii?Q?o93mV8FGDcX5eae/syeRbZp6MuTUBU/bqCrBnv7MfGTKUImYFThU8s61MEs/?=
 =?us-ascii?Q?cNyQ4ne5I4ud9l6bEQJYMqgNpZCHrXxd8nVg4Etw0qfjVglxU5lkcunZ9CGK?=
 =?us-ascii?Q?7W1AZk/C5gd3q97f6Ep+A7uYju61a3AjLjbL4/2rad+/dKe9cxtIvTfQ1SJX?=
 =?us-ascii?Q?7MDgkN9JNl/WELZLYixSub3YGfhu+feKw+S/qDKkvahBXzou4yXpXvu7Q8Gy?=
 =?us-ascii?Q?bMSPFPoWvYm9Va5M+xsf5cyp2fsLJ31bLDpE+fFVd7e2HTh9k7oPQ1HPL1VV?=
 =?us-ascii?Q?l1S6ElV1ssAw9sBOnvC4aPaYqycnau5KvWwn2YG27B6DdRlE4+/cVS+MV1i5?=
 =?us-ascii?Q?lA1mYFnoeQWQB38qTxjdVwmWAl7ai7qtt3nhGr0V66turlq0LFSF4NB51Q2S?=
 =?us-ascii?Q?OjUeqafUaizRJAe74XBnf5Z45iq5UVTvyl8JQj47s1L3+83mAbVD0NkbH6gZ?=
 =?us-ascii?Q?1YVZ2VaebFJrK6ubUxM1dfs5ZjH7EU8maWwRsBNh0OX8Acu+897YuwKcCDQi?=
 =?us-ascii?Q?rVi7FeiiiryNZN0DFA6owPtBb2ilPnQm65mdJDX1Lm+83fjGQca3y0pZEi1e?=
 =?us-ascii?Q?Xlu9viu+hFOkXs9gd+GUK2Wc/Q1fzV0p/bmrkEmDJSw54DjZ3haBMAiOHhq9?=
 =?us-ascii?Q?9zz8tA6vXoRXOCx/XlUG741mrWEex2jKCZeptHqvHdbwib3B3omSIbeyu4pJ?=
 =?us-ascii?Q?hdZrJ5R69VjI/IzAahZXftxRLq1F3J3R2ShuNXgqW3mNzDQumxbOFABKixg0?=
 =?us-ascii?Q?LVs9x19u8TJkuY+rGkl6o2d9BrMUaSvxwj4lw4ZpsuuCJiyTjdeZZVeqmxXg?=
 =?us-ascii?Q?ks14ka0aoj3hpiQFUvajMMQN4Cz5hC76wc2KxapxmQF8QxX7wbSFrVn1NGyb?=
 =?us-ascii?Q?RExGdKNIEelVjoAK+3mXCpVriwkrnkbFMr6dx2tNj4GQ4T/wgu5R6tl1yp0u?=
 =?us-ascii?Q?l6YnWlKntz7BwaK1opp1vUSP94hvKvUVgzi3BVbNeAFWUtmA1gCEkrAnx32p?=
 =?us-ascii?Q?s737qK+gd7NmDiQCQjWlJnY6q1PRUQGz2niaOJYGcmtifghPQQpGytec56Vc?=
 =?us-ascii?Q?Vy7+kAN/ADAmG+CtIwP9Cacspk0uzS26AjlLWsAtvd/mgGp4Mbc3WUjv7aZl?=
 =?us-ascii?Q?C1uJF7UCsde35u9dLMwie0F149IsJwWnZ0VaO5hreJBYbOe3XEKzyD+6uQUE?=
 =?us-ascii?Q?X0RdRJSDIn4NjDayjZdImGNOyzsT8pZDVxCwTuy9?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5933.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9b006ba-dbc6-4104-f237-08dba3aee4ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2023 07:59:36.0976
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0pGBTNe/f+/YcbjYiFwR3cuHuYV1f53yt6x39vebhRXWnsMA2WTVKJ8hzdcFRFChDmxDCmkntVls89ODEivNZyfnwh6sBOIsdEBaaDjMBw0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10143
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Stephen Boyd,

> Subject: Re: [PATCH v3 1/4] dt-bindings: clock: versaclock3: Document
> clock-output-names
>=20
> Quoting Biju Das (2023-08-17 07:22:08)
> > Document clock-output-names property and fix the "assigned-clock-rates"
> > for each clock output in the example based on Table 3. ("Output
> > Source") in the 5P35023 datasheet(ie: {REF,SE1,SE2,SE3,DIFF1,DIFF2}).
> >
> > While at it, replace clocks phandle in the example from x1_x2->x1 as
> > X2 is a different 32768 kHz crystal.
> >
> > Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Closes:
> > Fixes: a03d23f860eb ("dt-bindings: clock: Add Renesas versa3 clock
> > generator bindings")
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
>=20
> Applied to clk-next

As per Geert's suggestion [1], I am about to send a patch
for dropping "clock-output-names", as there is no validation for it and peo=
ple can get it wrong.

Is it ok,if I send a patch dropping clock-output-names? Please let me know =
your opinion on this.

[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/2023081709=
0810.203900-2-biju.das.jz@bp.renesas.com/

Cheers,
Biju
