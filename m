Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D6E64547F9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Nov 2021 15:00:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238040AbhKQODp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 17 Nov 2021 09:03:45 -0500
Received: from mail-os0jpn01on2131.outbound.protection.outlook.com ([40.107.113.131]:23825
        "EHLO JPN01-OS0-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238050AbhKQODP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Nov 2021 09:03:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d9pVbcpi3I2kVmKk8nYwUv3+SHgrlVWlIUWQegsyydBuJ1hvXXYRhQ8z5TtIn9mBrBMXGL7JB4YIDH8kpolxaEmdtsiNOaMNZQDnDYO7k32vGrqaXx1bzkpD2amC2vkUS2/vYxNrrPL2QiTEW9KAfqgDkGFnbV0JtSfgTTfU9S+/D59LZK9ob7oihnjnQv/WhMeZhZ5oxyO0wRlhpwoKN1ZjCdTz5C1f3Wbsu/TwJ7NTt7RwUJxnntRJBuEXmLVKNvFzG1OOX228M5mX0nvsNBlsayobWedMLCB/kYHdAqRrlO2XW13FZ81suifLOnE0Pe3qtKBtQaZ3hc4G76Tteg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yeo3a+TfoNWJ/PEUi+i18NyReSO0TJdZ6aDB7jeOPUs=;
 b=OL/CN915zAX7oaxFi4hEVh85TNWPmbJ7wIZFvk9qRS5SkcSHwy7Dic7HKLZSnr7G/urduBB7OnIKqaXmCj/wNbZPpyTx+PElkWYpNuj7uk9q8ES87M3/L5HrKjSpHFMpd9h9c063IHgTMgo7VrFtXA+LDCX1x5azrUBH6GAHZgzY++LW1cmstpN0eKv3XrPTmltOsVczsB4K3/BP/6TFD9wA8xpWL4ewWwIOu5y0i2AFdjspF2EXcUtR2KrsmMp+Bu0ArzgQWWbuEeQ7MY7+oY3S1ywJQWF4OK72tGweX4+0rGFumBiEQPnT60lvO7aZ0l59l1YEuah+KkdH1TJZng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yeo3a+TfoNWJ/PEUi+i18NyReSO0TJdZ6aDB7jeOPUs=;
 b=a+75BBhL14Nxgo6RHR93vyl3xUe2lV86LY9SNXHaWbnmgI2uQSEnjXctLbmU4o7nlj1eCzyf+broNb8+rZUE1N6//vc3l26UigX1jUWzKf+T614IuxHh48MQidRSiU5NPhLDWIoNn9Y7KJzv944JOV+fPQ4iRk4JSSw6awujJHo=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB3864.jpnprd01.prod.outlook.com (2603:1096:604:4a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Wed, 17 Nov
 2021 14:00:13 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153%8]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 14:00:13 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: RE: [PATCH v3] dt-bindings: mmc: renesas,sdhi: add optional SDnH
 clock
Thread-Topic: [PATCH v3] dt-bindings: mmc: renesas,sdhi: add optional SDnH
 clock
Thread-Index: AQHX2jrE4eSX7ohpXUa1PkZIvz7h+6wEx4EwgAAw7wCAAA+tYIAA7DUAgAABScCAADAKAIAALcywgAA6idCAAA7XAIABJVTw
Date:   Wed, 17 Nov 2021 14:00:13 +0000
Message-ID: <OS0PR01MB592292319A39A04502060837869A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211115160600.4455-1-wsa+renesas@sang-engineering.com>
 <OS0PR01MB59220D97CD59F44918DE4FA586989@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <YZKz/ptgPfzqGfeq@kunai>
 <OS0PR01MB592241C04F5CDDB94D850FFA86989@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdUm2EG3Yi+eTZA0E9tZOT71ewkbx=yh8sVOnL207Od3Rw@mail.gmail.com>
 <OS0PR01MB5922A978B55C09B9E754DBD486999@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdWVB_7U0R5hkO7eEkzdkmhwCEFstskvXJgO-dU1hog=+A@mail.gmail.com>
 <OS0PR01MB59220069B3113A206F31305286999@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592210D033924785A1C33A3386999@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <YZQUorBpiPS+qaLw@ninjato>
In-Reply-To: <YZQUorBpiPS+qaLw@ninjato>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5cf2d067-d6e4-40ba-af46-08d9a9d293ce
x-ms-traffictypediagnostic: OSBPR01MB3864:
x-microsoft-antispam-prvs: <OSBPR01MB3864FF8452166F96249EA1DF869A9@OSBPR01MB3864.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1079;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: W1bAou8s5vGOfajSKxtWMbwAYngplajAGDvatPd4UnXFwdGmRZJdCtM3pcnZpIB5jKDr2aM6KXdFZ32PzVbL3iVs0yOkLt8UPAQf22dcIYtWBUrmlD2FYzDiTTVhzKuzmTx6eKo3yNkZbF+2WzBYKnerVnNE7DEZdRXa5jGJUBgjkCZToniCuDF2bqVyDC61jyEwJhn4jHgPI1n9huJRDvxcC8nZ88zQ2fJqoIJrUKdKM/DLkS2B3K17dKPQ5gxI1Y4157T+wrZeRavS5/2U2in+bhoFXakSKj2BRTLXyxzOo8r8ccIy3vCkPNcDROrhaSLdrhmHBjcHxVX0QuR75js4RjeH2yANjitQwib++d6fuYRCn+8uL5xsn5eAKFpYk2bDZX1t9zzz04mx7YELs9/kwxZvaB5r/3qU+1lLY2FMzs3oqzTnl+seIIfHM5Z7iH1WhA0Go2Xl/nyVdZspRnp9U8OhowEODOo+91bN/LYkgF4q7Mpprdivod82C7Ip8au6hSXTdIQ5Q0cBDczviklAcq4FmEO6jvwowQbWnaKSRhTUi8gSUw5Kle67cHa+xxtK5gFosM6HFkDtr+G1oGmcUTzh+tRpBPzxbHnfwrK6/g7Ip9zJ12vzm3Ag7pM4YzhsGBj09kozBjgQTpzd+3OnYrJGx7xUkG9tEYM15gmoZNs+WdO2BJRUzCTKFwXwbX7M9ECEeggdujtDwVWZSA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(33656002)(26005)(66446008)(6506007)(66946007)(122000001)(71200400001)(38100700002)(9686003)(76116006)(66476007)(186003)(55016002)(66556008)(5660300002)(8676002)(7696005)(316002)(2906002)(54906003)(8936002)(52536014)(83380400001)(86362001)(4744005)(38070700005)(4326008)(64756008)(508600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2MvNyvzvICbszjf5XVWyMHvTqH/WzPCxVJVWyCQ4HXJY+41IoUDE58Fu08Ri?=
 =?us-ascii?Q?wnRks/+Mzxm6hZ3icKO+zD+TcKaUEXYPFDg4f7lozHIKyKXKDldR/wUDcRl0?=
 =?us-ascii?Q?0CLMTjCZ32yyiNbHwNaTpfEgmvhgeQGYX4rhmBk6AXAaPaPoB/12m6cELqkz?=
 =?us-ascii?Q?3jO4H6alh2vLjtu6Io9ChVDGP1wIRAyEH2tDTdca11HKxcRlL4/zQAvsMXl7?=
 =?us-ascii?Q?iNkJT+YQH3Ugr1PQ3rZUCfJMaVKHKVCiYBBVL2z0+f/+E9elgGxXK2n/K3gl?=
 =?us-ascii?Q?DS6ESgekOTxaYYMbIN99Cx+BcEZ+YmbEmuqQTmYOv9H48tQdF8uHFJD1pVDJ?=
 =?us-ascii?Q?q9sEeoa6KgCfjPI1sDmG75GjrJmllF7wNUPrENID8c73r4tzT99mJ/6+kMkC?=
 =?us-ascii?Q?atI/xqyzcaBsiqy8sxpJJ1Rr9EgdfliMQyQt2fs3/ORt/J/5jvpCbyzyZOP1?=
 =?us-ascii?Q?D9JIXooN4nYwinQxYnh9mK4+9jbNHZl8871BCf7a4gbQrQXtmZ94cM/eiSqh?=
 =?us-ascii?Q?erA+cac57xa2Y6jW2PWDdcb4J+RJxlLJEH63ly0UNUDSG/JJLxavqBX7H0uw?=
 =?us-ascii?Q?bGqSZNsnP19ewmylPHR9w8LDc+NO3WWCyKK0sbnGy+xoVyLXk9PZ+gKSBbRb?=
 =?us-ascii?Q?7Ks08wEomsoD14pWpHQ9Z7EBUEd+gyVxsroIP/E/8g0HexzFhU2cQDi1qlCY?=
 =?us-ascii?Q?BshiZio0CBZkrO8+MdDXkKXMOwW9YYMTDL5tpc3SN0oKdf9tT0AattG57LHC?=
 =?us-ascii?Q?jAiAmwwu6qGm+4Of1q5ezkT2X7BGvlQEwT+hxWcJqP1CSePSi0caeeL4GZfv?=
 =?us-ascii?Q?iw3jKmLWlToVrRe3I0rhiqlVs4/MGj1xeHPv3hgrLSMRQ5gouYWyzPw88gpB?=
 =?us-ascii?Q?60PuzWWKNN6YyjnOruZF8yLmR+kybXE9UPF3DJhM9lpsiMqyWinBXSrcEsXV?=
 =?us-ascii?Q?L69JawnZNfFRZ1ii2dT3EE4HDYv5JqTQp8ywad2TzX7CD5QSmhQXelcKo8MI?=
 =?us-ascii?Q?ZfwiBz1UqVGGgNkjQ6bUaDQU84rmQyuzzUKg1z6X58/qc0nTR1jfcPKXNNpy?=
 =?us-ascii?Q?RZnBXHnDlc/Mx0HWgpLJyPLw15fzanPLePqDeFOwLr4hgq/+dOu+MRKu9juD?=
 =?us-ascii?Q?p5HmlAA+1D2iinShSjZ9Lz6687Lv61OpayIhnVYmSV2fCuIPu7X2+4UHNDR+?=
 =?us-ascii?Q?BkMlG1EReYbl+E3/xgyYcTrV8/MPAJSYMBIau785tjNe/VG0RR2UdA59ET00?=
 =?us-ascii?Q?XXmHqKqdY265wsNTt3qSXMw0aRxmDbFGrMhPjWn9HG+FKK973pjaQmhDMWaL?=
 =?us-ascii?Q?91oBwzzLikJpxwnztz+tT119SNgIrX3kdJqnCHc5YrylAeAjSMGHlGzTtikn?=
 =?us-ascii?Q?fy3PJ+bmZigGkFPMHvdYkBX5pZLlDXC60VohFeIZASjOx04advdgZ+0pi9XY?=
 =?us-ascii?Q?WG8EI056tcUXCGMrzGZIoghFQb61nxolh5dapG1LrvgGjEs9mdMAcoZNOWPo?=
 =?us-ascii?Q?7X0DXnzf2tYLqmtG/xhDjpXQe48kY1dC+haBfnggIMyPCnzE4INDtVtZn6GT?=
 =?us-ascii?Q?NtkFpmWXxQ/XU9QGWqLVbC8OWTV8V9lu/iH4vB0GvO2dVDhvUqrj9FuxLNW4?=
 =?us-ascii?Q?8fk2aOZneog+1Xyv0iF9gbUpSYi0ea5xqa2eZdbQIYoSLxs2fHEUC07vfnmQ?=
 =?us-ascii?Q?LO7wbg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cf2d067-d6e4-40ba-af46-08d9a9d293ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2021 14:00:13.4263
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D6G43BacKqc3aNxN3Q5GUwKKouVTf3S6gkdq/ScwL07pXNj6v7R90T0I713ZCmZly0fOfJE3O+TWwegErehSxAVaQ3nCdy6FpzcX763ZImI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3864
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

> Subject: Re: [PATCH v3] dt-bindings: mmc: renesas,sdhi: add optional SDnH
> clock
>=20
> Hi Biju,
>=20
> > Please let me know, if you want me to do this changes as separate
> > patch(binding + dtsi) or Will you take care this? Both are ok to me.
>=20
> I think it is better if you do it. You can do testing of these patches.
> I'll happily review it, of course.

Agreed, will send incremental patch after this.

Regards,
Biju
