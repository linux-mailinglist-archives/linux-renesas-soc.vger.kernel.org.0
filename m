Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F0CE2559E9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Aug 2020 14:19:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729123AbgH1MTG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Aug 2020 08:19:06 -0400
Received: from mail-eopbgr1410132.outbound.protection.outlook.com ([40.107.141.132]:6115
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726904AbgH1MTD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Aug 2020 08:19:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iju/eRsKEFki1hp2CAggeP1GL8EkDJAj2LH1DP5oFpXa15bGtyftC3e35BcyQYryHRnukqdN5GQxFUl/4S9PA3ISIWS4RpPAwYoqPwREJwnBz/ya3+2fYm5UevFibRa0EGX3oNgRNP1I+UAFwlcZfRu2vSmVDltBpfKnqaFcGIAb+fbdDiMND2n1M1WZV425Ta82UzWMdbnrYqC7hw48TDYrOS/WUhWqcBhcACpZmDO7EOjA3ATGAq9PNVfv70XVFs/HEBlcGDi2+HMaz6u7AVRsCqBzNFcRacqiQNJz+iPx/jkttrG2xibSOL4wN6bqQ44M2teMrP5Srttf0/9r4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0Hps5R16v3Zx8vtwcWi3znIu231Nutnrwn9FGcfBAA=;
 b=HPomwV2pHzz6SlWwrCp4mU3cncwgmDko3BRDT6beF5urU1Yhbj6Ex+fy0JRDxj5/DR07rcHaJal4vL9/K3RWxAS1fLUeKOJztygE071+Yq2ytHXNmdsiVC8ed52TAm0di6t6VA3N7FUhXa7UNwTeGVrqK/n9Q5ECGH3vQPYsdgU9/1Gh0s13Kum/7WeBC0HL2mz5cq4GnKQeDvz/MWZQfhGiN5vgJk2XjJFoc16LZpW5VOujgGukEfJLKVE3FhgtJzjuxydRW5BpLB0JKRGgTGXSwYWJo9n4662MhWsZvxJCanIhIY559t8Q0Lu0aJIgLkVkpRrAP2UkezPKq+/aFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0Hps5R16v3Zx8vtwcWi3znIu231Nutnrwn9FGcfBAA=;
 b=IED3yhiQ385KGY5X3Yfkrlk6LWasXiaOxMuPDS+bbGR6m7XdEzYfGbWyqoBjKXLJJkTnvJMEDr2m4FOHrXw+pplh2ydmw5UsEFN7R7xYVkFvw3YAENfqxIVMcGCTVyukgOZNNNsZdFEjGR4C2FITRI8pvvZpWZUYuZwD0IgyyI0=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB2958.jpnprd01.prod.outlook.com (2603:1096:404:85::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Fri, 28 Aug
 2020 12:19:00 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3%6]) with mapi id 15.20.3305.032; Fri, 28 Aug 2020
 12:19:00 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [RFT] mmc: tmio: reset device on timeout, too
Thread-Topic: [RFT] mmc: tmio: reset device on timeout, too
Thread-Index: AQHWd5Nzg4tKYT7IDky74I31z7szlKlNeZzg
Date:   Fri, 28 Aug 2020 12:18:59 +0000
Message-ID: <TY2PR01MB3692ED98183C4248163CECAFD8520@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20200821081654.28280-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200821081654.28280-1-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e677614a-19b7-4d5f-a31c-08d84b4c8b6a
x-ms-traffictypediagnostic: TYAPR01MB2958:
x-microsoft-antispam-prvs: <TYAPR01MB29584D305AAE213665CCE0BBD8520@TYAPR01MB2958.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N722hG/2oEVPYUxG75COF/T46lJXrN/1gejjaSCh/hu0zvHshsEKHJ1NmcJMlF/iZRWv89HheCsXLbKoP0TXIxQ4XV6NOqQu8j5wT9YFYI5JVmvtMETaiKdXAmNhSnq1NwCl30Sk+B3dvPuO79dZJQSxfr8oo6xBRXOr+FRHmmE+3ou5Zw3PRahjWNimwnpWOBU5lVlus2bO8basyBZ32AA3OoHP6Q4CUHO9uoXbEjwlCFmIWswDGmP6XffmS7Rr82YnsC7hhcCi9+Fg+XZqGTrnaOEBI69ryJLUuqdhYbgTW6fHKoG9hYnux6xAHP3XF1cZdubI0ev8PyePQFIXWg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(39860400002)(366004)(346002)(7696005)(478600001)(66556008)(316002)(6506007)(66946007)(83380400001)(71200400001)(66446008)(8676002)(64756008)(66476007)(26005)(86362001)(52536014)(55236004)(33656002)(9686003)(55016002)(110136005)(2906002)(4326008)(8936002)(186003)(76116006)(5660300002)(4744005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 7G5ojpwW8rhCiVInKLO41fYkoolZJipLsr2MlBQ+7QQvtOV8fPnnaL3HAGufXQNMdi/eAXr0GlR83oS7ZPHnz7wZ3xfEKKoeEuX0R9GqgD/a8hKqUCzOZWSsCjNUQEwBvo1Rs5Qe+yTv3qSjoDRV58IEzpdxb6XZOpFLHxbKxziVmeoS/SYMu5RS0SSzGA+hWWoSSIfoFWoizJEXmiRrcCpZUEkC+LYR8WSB9ENRoAwF/T25oKZrT/OKMc43l9rsgbErYLNq0DxM1PTC1F1giTZz9S9/HETd516sdeP+y15Nc8HrplT+f0MpNq1JY+t2hLeG9tueZ3agPCaHE+kCXgcSgIavfpkioabynxyu2GvbDiNB3AWDPZoVjtz83SijJ0+dZwiT0/NZ7yMafW5CJwUknhKpEnZJZfbFkTJdpg4qH0Wy52hWzx/221/O/MJpAUpiazDEqDQov7Be8C8KEhdNCdUj5dCV5bQA7uOC2Hftu5WH3ZNrUptgcbqquVVeDxEyFcshIEwLYosVHxZkyV03WeJiMu9+HLQWyKVPYpb++UbMS94P7/LdZ22grxFyWu36nfpHHqddpoxCPTcLRtXe5kuPS1dCGATmIYHw6OqoHy71nNpMqRPWCVO76N1hFP79vCElFFqrfW4SZGBruQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e677614a-19b7-4d5f-a31c-08d84b4c8b6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2020 12:18:59.9805
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 35wBGQiB8BpYVV4FYJUSmdUXO65GqQbUqX8Q1kFodar6IVX1/14taRnETYYllhBsKM29DVEeCdYfGFWii5jOcXJPHQzp7Hr3AeVDehNQoJQXeGsYU/ueIPf5h0RrX2of
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2958
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Friday, August 21, 2020 5:17 PM
>=20
> When a command response times out, the TMIO driver has been resetting
> the controller ever since. However, this means some initialization like
> bus width or tuning settings will be forgotten. To ensure proper working
> in all code paths, we will enforce a reset of the remote device, too.
> Many thanks to the Renesas BSP team for the detailed description of the
> problem.
>=20
> Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>=20
> This patch depends on the TMIO reset refactorization:
>=20
> [RFT 0/6] mmc: refactor reset callbacks
>=20
> Looking also for tests here. Thanks!

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Also, I tested on R-Car H3 ES3.0 and confirmed that this patch resolved
an issue which any commands of eMMC could not work after
tmio_mmc_reset_work() was called. So,

Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

