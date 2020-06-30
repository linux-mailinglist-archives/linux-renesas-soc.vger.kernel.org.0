Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E7FB20F0EB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2020 10:53:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730420AbgF3Ixn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Jun 2020 04:53:43 -0400
Received: from mail-eopbgr1300095.outbound.protection.outlook.com ([40.107.130.95]:13380
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728132AbgF3Ixm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Jun 2020 04:53:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZPrnZIPxvnE0ahVlBvEVLXXVEW3tpi8a1xDB9VqZKcpVQUmHfUcRCl9zw3PtPJqfVnLzY3SwamMJucisOAWcfiFP5RRdDMQc17RHyYzy8GKDQUPABLBeZHIFOXAY1AiFHmgFc5dbIRLITIzTMEznDrhpJofMoLmaHns2Ydfotovh9ewGsQDtdbi6i9K37aEdBnnXLCjUDum3sqcllha7po9GLw4KgG/bA+R1T7f8s06NmYhwfqpcaZZ/+VvETYyUd/T/WGlXfLuTqMYMBTfxmojxGZ/eG+fugs/5llw9jfJdnKxLnBVJz3TPYk3cIy+rL6HZt/6sXl8O4PnzM+Dv/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rVeYMd+ehgPvrNh64OxMIxywaeysgL3I4Vn6zGgVZ7Q=;
 b=ag5kCn73DAQvUZ8C4dusiJNwZs4f7MIpgEc+6tE/1DpzTDo/geig3B7JVE+36ib3+kaaXEYL/16Onn4KHJpof+TNnj4N+xf5b4O73bz0nswA0BNd6kC1Yhjx0MLJVNejvSyKG/+QrsjlV669PT8mFnWm2ADs83UziL6laaMRpRazVQZJsEo/AX5ICpxqmToyFjF65ZuW2sXL5vYbwjtFeLgbIu+pPJ7JjRWiuKBmo/UAgtIEwQSxJE0vSmZ5ySLt+jBkVeumVRuHp3jiGOYABr1SYwAVsi51hBLvF/Nve4MbRr/NTeBsToxQfJWzny79+xNB1lILdZn2rpTpP/VFUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rVeYMd+ehgPvrNh64OxMIxywaeysgL3I4Vn6zGgVZ7Q=;
 b=enYqyyWqe2/wZuxsKLiud9pqrOpxcjHB0HM9yYv4VhQH52zoaI9xpPQg4UvSPtMUMc1OdG45aUJELh+Tx/3esuPgJAgV2yrgipKN2eGuMnZM6PgAsjsCNLrabJUByThT+KmjXxN54gDv8h9ov+e0en9Wmv3gAIwxuu1ofS5CCsY=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB3513.jpnprd01.prod.outlook.com (2603:1096:404:db::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Tue, 30 Jun
 2020 08:53:37 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3%6]) with mapi id 15.20.3131.026; Tue, 30 Jun 2020
 08:53:37 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Sudeep Holla <sudeep.holla@arm.com>
CC:     "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH/RFC v2 1/2] firmware: psci: call
 pm_set_suspend_via_firmware()
Thread-Topic: [PATCH/RFC v2 1/2] firmware: psci: call
 pm_set_suspend_via_firmware()
Thread-Index: AQHWRizdA1/SKsvGkke2C5hIiCsld6jvuAkAgAEtEuA=
Date:   Tue, 30 Jun 2020 08:53:37 +0000
Message-ID: <TY2PR01MB36924B54F6680CCA0DF83E22D86F0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1592566143-4546-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1592566143-4546-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20200629141025.GA25875@bogus>
In-Reply-To: <20200629141025.GA25875@bogus>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:6993:87cc:5ed8:ca72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: baf2b122-f589-4584-0cba-08d81cd3141d
x-ms-traffictypediagnostic: TY2PR01MB3513:
x-microsoft-antispam-prvs: <TY2PR01MB35134CED35F58ECDF5D7E636D86F0@TY2PR01MB3513.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0450A714CB
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R/6x0r3KBQPs5fYboaDZBnZie0N1ohvjvuw8VTCH/qA6W/c0yuSPFSZaRE8KnrZT4kSejee28jlC/hf1qUCSFkfaeJ2jcBd4yOZsvhs9vqareXALhwpSxHRD/+wSp+7mQCExFTJANynxM15sJz8FKJbSXV1PxypqiRCDk7uW/J9YsEuTO/r+rHGGQcKpNUTKbOy7ulRBEHw/hftL7qodcHdMN/BakiRTvCEPd2f9V4X0Z/GXGnQmDgfs90AWP86hIn7vTOAtSTxER7icRu3Qe4sc5RHInnndkhEpdP+H7mqYMH8IcBOUiOzUKAOUWqm2dAendpSaGxZV34yqGHRuZNDH+gyCFQXXudEQhb6N5jZkEa8GOP9iuNXICs+uKA5spfXOCAFS2J7+GczQflC54A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(396003)(366004)(39860400002)(376002)(346002)(8676002)(52536014)(71200400001)(6506007)(2906002)(76116006)(9686003)(478600001)(83380400001)(7696005)(5660300002)(186003)(4326008)(66476007)(64756008)(8936002)(966005)(66946007)(55016002)(66556008)(66446008)(86362001)(33656002)(6916009)(316002)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: lcGGSWJ1+vE2vvmaekmX8f5lvoAtdF3NmcmBG7o1NLkUkARcpkMO+R/YVXWUX/ebpRtRrrU7blJly39am6vf8RbSwJhxgET/tH+E2OC5dj9dOcadXcY4AZJEAc24Qh4Q8yQTO+uknwkrzDCvQlv4U2kpvPur59StkCdLEiF2xnHz0YxmezEuEcTFWNeniwDXW3kL2cwWYbkXaodH1RxtpH5cgaX9hjVoRoFIwAnJNGn8T0noo79MmgYljDDivCGP3FS6Ayqfv51tUPw2rAq3pD8NieMIp4Ql7PS5mFabLDWUvicAi06Shu0O0Q0Ctz/C2ArFVNqgSV/z4MXaC06DxAS0kVfu0pFZ0lDWz1WRwP+M3gmYcwe1mTZvgN+a9BXU7RbhNJ3A8FZJF+1SZDXoaK06KUAIRJnJxSaUcoiFS5QZ5g3+WOQ/J9vj1LhoDymFM5SYZ7C0GBbPidhTc7f5XT4W3O3AStwRaUkIH/XfWIghmi03QD3Gna+jAAxeBcKfknUkLz4DjmdEdxImwM+O5SmRM1a5BM72jqxDVmqZFzk=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baf2b122-f589-4584-0cba-08d81cd3141d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2020 08:53:37.3131
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VNjPhdu2/DLpWVa95sQpK8uZPGV2gFMLTIMRxZJRbRAm7qebTE5aPZsVzB8MUj6cuPKEZCdLpVrf+J6p9mHJ+PT/Cx2+Raltg/Fc0nIJ0nyvGezHWdY/5Bn1dzh3HKTa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3513
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sudeep,

> From: Sudeep Holla, Sent: Monday, June 29, 2020 11:33 PM
>=20
> (This patch never made it to my inbox, may be due to ALKML issues on that=
 day)
>=20
> On Fri, Jun 19, 2020 at 08:29:02PM +0900, Yoshihiro Shimoda wrote:
> > Call pm_set_suspend_via_firmware() in .begin() of psci_suspend_ops
> > to use pm_suspend_via_firmware() on PSCI environment.
> >
>=20
> I don't have issues with this change as such, but I need to understand
> how and why this is used. I will comment on that separately.

I thought MMC driver could use this API to detect whether the firmware was =
suspending or not.
However, Ulf said this was not a good way because all implementation of PSC=
I
will not turn the power off while system suspend [1]. Also, as you and Mark=
 said on other
email thread [2], the current PSCI specification cannot inform system suspe=
nd state
to OS (Linux).

So, I think I should recall this patch because this cannot get expected inf=
ormation.


[1]
https://lore.kernel.org/linux-renesas-soc/CAPDyKFq-dEPaU094hrk2xg18VpJAsbnf=
8enieFmcMhKiB1bW1A@mail.gmail.com/


https://lore.kernel.org/linux-renesas-soc/CAMuHMdXh1Hh6H35Mp8hBJBykUucRNwxT=
mW+U9SHM+xhrcwasDA@mail.gmail.com/T/#m442a2ce972cfdb3ff33637c120c8d096e4d07=
af8

Best regards,
Yoshihiro Shimoda

> --
> Regards,
> Sudeep
