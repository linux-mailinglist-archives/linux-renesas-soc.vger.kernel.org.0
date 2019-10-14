Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F12CD5C97
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Oct 2019 09:46:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725936AbfJNHqY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Oct 2019 03:46:24 -0400
Received: from mail-eopbgr1410139.outbound.protection.outlook.com ([40.107.141.139]:34400
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725934AbfJNHqY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Oct 2019 03:46:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W8LruMp5sQgLkIayyQbAbaOA2fBqsM+qBnjzdi1IACKEY+KLnIlHi/E3X/ghcyPLALz7kMGf3QvimXGJHScZ05LhCx6A8mtWXiKY70wOQ0gDGlIvan2QpaJntcyaLFa6GQj5C1w7UMWUorHgh+fEKTqAiRN5XBXTEJMBdH7KXEQ84i3w+mpUjP2Rp/7uCzmc3Frjl926zIdZkMRa7GaHaGkhtH+SQj/IcZ1DZSkgL4q980QUcywDm5KfSzD8ib8nlUViAdE4fbz8n8oAq1pI5+Vt8wa2Cr7IYAO2+7+Q3LDUe0/VuGSgmIYFdizPZD93RjwEuFCCwEAIszyOnFwY/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2QUsxAWOB4swx2EXrOgQZfh4F8W4/UNmWBIUDEYID3I=;
 b=TeQMwex4maA5X5fPa8XQbyjrdmqhyiyj+4kFSdCa9nuFX8dC9UEZ9R56MIiPBamavfiBrvuMeyGZP5h0NMYDH4mT2OKqe3W3MZt5ZSwYkQnuPSgXm9VLDnStrVX4/pxTiqSfOKdx9J/gpBjw2RsJpi5xbiL06VeG+AmpqM9QuhTwKvup/4D5IJHDzC997GKdmbtXhFt+8egTBrRFOwHvWnR6cYA/bL+/LAwyEquekrz/WvE2P8URbgWyC7BTI6l7x7DHjB58wrx0/BKLDOgd1B015xljnzzila2GXHKY+02SIGYwWRAPesm/GdvrKkgYqqkP/fBV/eeMd+Y2onRP1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2QUsxAWOB4swx2EXrOgQZfh4F8W4/UNmWBIUDEYID3I=;
 b=EA00qR0rJ/+KzjMKtsFdL8ircAC9ZdQy4V+sNy5B7vPDI4jsPGBepm82zQEV4sEKoEXCwcoP7npqVsuF0XRSygYLk5ZrlIj/q/j5C/M4r50J3W29hKMK6tavMKHnEiV9fSlAqLpb5ztwVpPWY1ZAnh3MRMXiKy3nH6qMhyt0/xs=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB1480.jpnprd01.prod.outlook.com (52.134.225.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Mon, 14 Oct 2019 07:46:19 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::dc33:9b1f:4522:550e]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::dc33:9b1f:4522:550e%3]) with mapi id 15.20.2347.021; Mon, 14 Oct 2019
 07:46:19 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Dien Pham <dien.pham.ry@rvc.renesas.com>,
        TAKESHI KIHARA <takeshi.kihara.df@renesas.com>,
        =?iso-8859-1?Q?Niklas_S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: RE: Regarding CPU frequency reported by Salvator-X board
Thread-Topic: Regarding CPU frequency reported by Salvator-X board
Thread-Index: AdVu1v1XonYj+BwOSuOvcVeOj6MplgTilsFg
Date:   Mon, 14 Oct 2019 07:46:19 +0000
Message-ID: <OSBPR01MB2103F7095937F52BD9D2FFDEB8900@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <OSBPR01MB21035AD5CA51E3CCFE6F61C6B8890@OSBPR01MB2103.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB21035AD5CA51E3CCFE6F61C6B8890@OSBPR01MB2103.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8cf730fe-7871-4dc2-6d07-08d7507a99dc
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: OSBPR01MB1480:|OSBPR01MB1480:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB14805700DD86C0023E298C72B8900@OSBPR01MB1480.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01901B3451
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(396003)(136003)(376002)(39850400004)(366004)(346002)(53754006)(199004)(189003)(13464003)(33656002)(66946007)(102836004)(6506007)(71190400001)(26005)(66446008)(71200400001)(53546011)(7696005)(86362001)(66574012)(6436002)(229853002)(74316002)(14454004)(305945005)(7736002)(66066001)(76116006)(76176011)(99286004)(66556008)(64756008)(66476007)(25786009)(8676002)(256004)(8936002)(81156014)(110136005)(2906002)(81166006)(52536014)(186003)(478600001)(55016002)(5660300002)(446003)(486006)(44832011)(476003)(2501003)(11346002)(3846002)(6116002)(9686003)(6246003)(316002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB1480;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ngVhIS4OindPLROi3pbS9m48pwsfm7SNWA1xbxxFgnXEd2/Me3pJdKQtGJjSIOn8FlzAhhBDeeIqBHArRGGz0JH/0JD2nUOofrTdOFfL6BUQfodUB3cf71nETtrlCCielirClfQkHp7YsT/RyW/aGNzqvHKYQ14qayAqd0Uvrw1iIzCkeb5DmpUv78KqvivjjdmbCLBGDbLeICRsaW5KfzdbQJObF65cZjThiSfM3s4r5OhWoGNmo6CqbJCFkDhRRa6SLUmI1WBJQPMc4kXvzDFRu2lAV19yFx5OQKAzqg5Rt1/8/IOjSxNqQ4pF4FFxTZhX/Td8Lmudq93b9oKaBWDa//n2S+VoU0Q1rGcoueSyLOzGJhDflw9UBWISeLki8NUQLpKVluXs+Zg/Jn33LlsuoRPNzMrZp1q1cj2oTeo=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cf730fe-7871-4dc2-6d07-08d7507a99dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2019 07:46:19.2257
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5HbG5t53WOVhDR6xdBpNdnLX7joI7kHQAh9zf0hlnrNuAewpweOGSF7FxnEHgPQG99+9XWINYjhXyy3GmyphZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB1480
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

HI All,

I have further investigated this issue, please find my findings below

The  "cpg_z_clk_round_rate" function is called 2 times from "dev_pm_opp_set=
_rate" (1 is direct call and other through "clk_set_rate") function.

For 500000000 frequency, after doing math operation(mult =3D div_u64(rate *=
 32ULL, prate);), it gets a factor  10--> 10.66 truncated to 10 and the fre=
quency returned by the system is  468748125

On the second " cpg_z_clk_round_rate ", the below function make the value t=
o worse, it gets a value of 9.9999, since it is integer division it is trun=
cated to 9.
mult =3D div_u64(rate * 32ULL, prate);=20

Now the frequency 468748125, after doing math operation becomes 421874 KHz.=
 This is the problem.

So I think the div_64 is wrong here, Instead we could go with DIV64_U64_ROU=
ND_CLOSEST.

With "DIV64_U64_ROUND_CLOSEST" the factor is 10.66 which is rounded to 11.

So for 500000, after math operation, it becomes 515624

Please share your opinion this issue.

Regards,
Biju


> -----Original Message-----
> From: Biju Das
> Sent: Thursday, September 19, 2019 11:49 AM
> To: Geert Uytterhoeven <geert+renesas@glider.be>; Simon Horman
> <horms@verge.net.au>; linux-renesas-soc@vger.kernel.org; Dien Pham
> <dien.pham.ry@rvc.renesas.com>; TAKESHI KIHARA
> <takeshi.kihara.df@renesas.com>; Niklas S=F6derlund
> <niklas.soderlund+renesas@ragnatech.se>
> Subject: Regarding CPU frequency reported by Salvator-X board
>=20
> Hi All,
>=20
> I started testing  frequency mentioned in OPP table  with M3-W1.1 Salvato=
r-X
> board (NOT salvator-XS) using user space governor
>=20
> The actual frequency reported for 0.5GHz(500000 KHz) is too much deviated
> from the target  frequency [INFO] Target frequency: 500000 KHz [INFO]
> Actual frequency: 421874 KHz
>=20
> But if I change the extal value, as per the board schematic (16.6666MHz),=
 the
> value is some what closer to target frequency.
>   &extal_clk {
> -       clock-frequency =3D <16666666>;
> +       clock-frequency =3D <16666600>;
>  };
> [INFO] Target frequency: 500000 KHz
> [INFO] Actual frequency: 468748 KHz
>=20
> Q1) Have any one  seen this issue? Please share your thoughts on this iss=
ue.
>=20
> Note:-
> I am not seeing this issue on Salvator-XS board, where the extal_clk valu=
e=3D
> 16640000(16.64MHz).
>=20
> Please see the logs
> with clock-frequency =3D <16666666>;
> -----------------------------------------------
> root@salvator-x:/cip-test-scripts# ./opp_t_001.sh  [INFO] Testing cpufreq=
 for
> policy:
>  [INFO] /sys/devices/system/cpu/cpufreq/policy0
>  [INFO]
>  [INFO] CPUs affected:
>  [INFO] 0 1
>  [INFO]
>  [INFO] Available frequencies:
>  [INFO] 500000 1000000 1500000
>  [INFO]
>  [INFO] Target frequency: 500000 KHz
>  [INFO] Actual frequency: 421874 KHz
>  [INFO]
>  [INFO] Target frequency: 1000000 KHz
>  [INFO] Actual frequency: 937499 KHz
>  [INFO]
>  [INFO] Target frequency: 1500000 KHz
>  [INFO] Actual frequency: 1499999 KHz
>  [INFO]
>  [INFO] Testing cpufreq for policy:
>  [INFO] /sys/devices/system/cpu/cpufreq/policy2
>  [INFO]
>  [INFO] CPUs affected:
>  [INFO] 2 3 4 5
>  [INFO]
>  [INFO] Available frequencies:
>  [INFO] 800000 1000000 1200000
>  [INFO]
>  [INFO] Target frequency: 800000 KHz
>  [INFO] Actual frequency: 749999 KHz
>  [INFO]
>  [INFO] Target frequency: 1000000 KHz
>  [INFO] Actual frequency: 974999 KHz
>  [INFO]
>  [INFO] Target frequency: 1200000 KHz
>  [INFO] Actual frequency: 1199999 KHz
>=20
> With clock-frequency =3D <16666600>
> ----------------------------------------------
> root@salvator-x:/cip-test-scripts# ./opp_t_001.sh  [INFO] Testing cpufreq=
 for
> policy:
>  [INFO] /sys/devices/system/cpu/cpufreq/policy0
>  [INFO]
>  [INFO] CPUs affected:
>  [INFO] 0 1
>  [INFO]
>  [INFO] Available frequencies:
>  [INFO] 500000 1000000 1500000
>  [INFO]
>  [INFO] Target frequency: 500000 KHz
>  [INFO] Actual frequency: 468748 KHz
>  [INFO]
>  [INFO] Target frequency: 1000000 KHz
>  [INFO] Actual frequency: 937496 KHz
>  [INFO]
>  [INFO] Target frequency: 1500000 KHz
>  [INFO] Actual frequency: 1499994 KHz
>  [INFO]
>  [INFO] Testing cpufreq for policy:
>  [INFO] /sys/devices/system/cpu/cpufreq/policy2
>  [INFO]
>  [INFO] CPUs affected:
>  [INFO] 2 3 4 5
>  [INFO]
>  [INFO] Available frequencies:
>  [INFO] 800000 1000000 1200000
>  [INFO]
>  [INFO] Target frequency: 800000 KHz
>  [INFO] Actual frequency: 787496 KHz
>  [INFO]
>  [INFO] Target frequency: 1000000 KHz
>  [INFO] Actual frequency: 974996 KHz
>  [INFO]
>  [INFO] Target frequency: 1200000 KHz
>  [INFO] Actual frequency: 1199995 KHz
>=20
> Regards,
> Biju
>=20

