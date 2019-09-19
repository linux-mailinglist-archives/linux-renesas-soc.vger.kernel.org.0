Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6C79B77B4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Sep 2019 12:48:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388028AbfISKsk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 19 Sep 2019 06:48:40 -0400
Received: from mail-eopbgr1400114.outbound.protection.outlook.com ([40.107.140.114]:19510
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387520AbfISKsj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Sep 2019 06:48:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pb0crKHbadjqZg1t+2Qkc8WDqryJkmA1XDjbUkvonwA8eE/9kYnSVX+qeA0Io1TCyOMK8KM1T25ScSIMGd+r0+ZPQsHz9qtNIiFi+ysOwNkQnn7WI+dfNru3/jiGI8J6XsDVwjJlZB1oDEobDwlDe82wMoA6+0NjtLihR4eZWdq03kbDrcddPFprZtHMAN0F5s00tJCB2PfN9jZVlXA5Vb0PTPblRPosplL7tMpcqdV+i2sr8xRK1T9XS9cgUgWSrtYgFYcp6cCA/HE+Lm4EDnETytBXec5yN4VPgK2czmzfmCO4/jHxHmQQ9D4d7vzjmddmSUOC4I9bMpxKvRpAmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PGgh5lBqzgL/c4rOyefJYb4ecyVE/6Zg9zkG8GyHrkI=;
 b=jSxyqMPEs3Z9BsjpoflYJxFSQ7oZOxv+uBS34FMR8IalZ0FmDQVbGB1c2dZKEtEjATNTB2gUtnuzaW2znOsZD2x661V/1SF4Eo6tOo/FAIZlweWGzTkbxC6qI6Syvoorwm8QI4yje4G25dtug8Jc4loR+NpEn/W2wUaFcC2t2bi5nyFQ1cuuH80Q5AB6IxtNegMjG/mhfZtKb2ODLeKAjYJSCem7YI/D5EMxlTzszsOO7U4parqNQ6pX//zLz4z/X1j+EPxsVK6Yrre1OTdzw/FKsc6/yxRFF6tZ7H59pu7LWCcmukwfUlNkYYziB9N7qnxeKo8FsdCbV76s4zNeyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PGgh5lBqzgL/c4rOyefJYb4ecyVE/6Zg9zkG8GyHrkI=;
 b=BL/nxj2DR/2SCbJf0rONbO9vA6Bb8LGkahyACljIlSgJplbi4XPDb4/kPd2CJ+c1pReqKVPDcMFR1sBctNaeIOmfz9G5VeADAwLGkpam00/S/dvDZ/azsqHsPmOhMRpfztg6LGskkbgl5FXi1WoqDcqwrTk8c8QqoyTfGUj3v/0=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB3288.jpnprd01.prod.outlook.com (52.134.255.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Thu, 19 Sep 2019 10:48:36 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::746b:49c1:925d:e9eb]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::746b:49c1:925d:e9eb%5]) with mapi id 15.20.2263.023; Thu, 19 Sep 2019
 10:48:36 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Dien Pham <dien.pham.ry@rvc.renesas.com>,
        TAKESHI KIHARA <takeshi.kihara.df@renesas.com>,
        =?iso-8859-1?Q?Niklas_S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Regarding CPU frequency reported by Salvator-X board
Thread-Topic: Regarding CPU frequency reported by Salvator-X board
Thread-Index: AdVu1v1XonYj+BwOSuOvcVeOj6Mplg==
Date:   Thu, 19 Sep 2019 10:48:35 +0000
Message-ID: <OSBPR01MB21035AD5CA51E3CCFE6F61C6B8890@OSBPR01MB2103.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0f7bdf55-d53e-4985-c006-08d73ceeec48
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB3288;
x-ms-traffictypediagnostic: OSBPR01MB3288:|OSBPR01MB3288:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB3288E56A77FAD16BE1E75766B8890@OSBPR01MB3288.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 016572D96D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(346002)(396003)(376002)(136003)(366004)(39850400004)(189003)(199004)(53754006)(86362001)(6436002)(9686003)(2501003)(14454004)(66556008)(66476007)(486006)(256004)(478600001)(44832011)(81166006)(81156014)(55016002)(7696005)(64756008)(66946007)(33656002)(66446008)(2906002)(99286004)(76116006)(6506007)(305945005)(26005)(7736002)(8936002)(66066001)(25786009)(102836004)(5660300002)(74316002)(3846002)(6116002)(186003)(52536014)(316002)(476003)(71200400001)(71190400001)(8676002)(110136005);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB3288;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: djcEBUCBH6dYIcdxvpIBstqD4BqB2GOjHEwXJPcZjAradBbcTSWub79zWhKi6N8qEmyPFC67vTnGpHudbU8UXd2JaVAPBcj/mxgZxXFvFta3jbqREF0Yin6F43luiiwrIA717UXbVJ/J/5S3Mpwu5eDRxwuhlvviAbr3VSD85kUvlZMoPZSqfWi0PY0xt70alVHBJWUevw7kuaOvLKIHcCaNIhZL7MqBne9iNPfBcrsYZeLlWoKsUf1yIif+9u4j/6kVi40OlH7DyBKipF661puJutf4hZ59NKAw/9+gwz2ZwALmoBvaest4BZvlsYZAswEv5nhZzJtnkRr6+trrmXnPghcac0rjnMh31rKJlIS0FK/iU35sdc54ZB+BsDABoKVlct3VIszNPIhD3QgkF7xcWsVjm8r0+pQW5xiQZ9U=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f7bdf55-d53e-4985-c006-08d73ceeec48
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2019 10:48:35.8969
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v1OSuYxssNaCdfrcuPG3anLUvf2+Hae1MyRJ6r8fx7afTfVUwd7HlsHCrzIlD9SrNtdiAuXz9V6vWBi5wceLJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3288
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi All,

I started testing  frequency mentioned in OPP table  with M3-W1.1 Salvator-=
X board (NOT salvator-XS) using user space governor

The actual frequency reported for 0.5GHz(500000 KHz) is too much deviated f=
rom the target  frequency
[INFO] Target frequency: 500000 KHz
[INFO] Actual frequency: 421874 KHz

But if I change the extal value, as per the board schematic (16.6666MHz), t=
he value is some what closer to target frequency.
  &extal_clk {
-       clock-frequency =3D <16666666>;
+       clock-frequency =3D <16666600>;
 };
[INFO] Target frequency: 500000 KHz
[INFO] Actual frequency: 468748 KHz

Q1) Have any one  seen this issue? Please share your thoughts on this issue=
.

Note:-=20
I am not seeing this issue on Salvator-XS board, where the extal_clk value=
=3D 16640000(16.64MHz).

Please see the logs
with clock-frequency =3D <16666666>;
-----------------------------------------------
root@salvator-x:/cip-test-scripts# ./opp_t_001.sh
 [INFO] Testing cpufreq for policy:
 [INFO] /sys/devices/system/cpu/cpufreq/policy0
 [INFO]
 [INFO] CPUs affected:
 [INFO] 0 1
 [INFO]
 [INFO] Available frequencies:
 [INFO] 500000 1000000 1500000
 [INFO]
 [INFO] Target frequency: 500000 KHz
 [INFO] Actual frequency: 421874 KHz
 [INFO]
 [INFO] Target frequency: 1000000 KHz
 [INFO] Actual frequency: 937499 KHz
 [INFO]
 [INFO] Target frequency: 1500000 KHz
 [INFO] Actual frequency: 1499999 KHz
 [INFO]
 [INFO] Testing cpufreq for policy:
 [INFO] /sys/devices/system/cpu/cpufreq/policy2
 [INFO]
 [INFO] CPUs affected:
 [INFO] 2 3 4 5
 [INFO]
 [INFO] Available frequencies:
 [INFO] 800000 1000000 1200000
 [INFO]
 [INFO] Target frequency: 800000 KHz
 [INFO] Actual frequency: 749999 KHz
 [INFO]
 [INFO] Target frequency: 1000000 KHz
 [INFO] Actual frequency: 974999 KHz
 [INFO]
 [INFO] Target frequency: 1200000 KHz
 [INFO] Actual frequency: 1199999 KHz

With clock-frequency =3D <16666600>
----------------------------------------------
root@salvator-x:/cip-test-scripts# ./opp_t_001.sh
 [INFO] Testing cpufreq for policy:
 [INFO] /sys/devices/system/cpu/cpufreq/policy0
 [INFO]
 [INFO] CPUs affected:
 [INFO] 0 1
 [INFO]
 [INFO] Available frequencies:
 [INFO] 500000 1000000 1500000
 [INFO]
 [INFO] Target frequency: 500000 KHz
 [INFO] Actual frequency: 468748 KHz
 [INFO]
 [INFO] Target frequency: 1000000 KHz
 [INFO] Actual frequency: 937496 KHz
 [INFO]
 [INFO] Target frequency: 1500000 KHz
 [INFO] Actual frequency: 1499994 KHz
 [INFO]
 [INFO] Testing cpufreq for policy:
 [INFO] /sys/devices/system/cpu/cpufreq/policy2
 [INFO]
 [INFO] CPUs affected:
 [INFO] 2 3 4 5
 [INFO]
 [INFO] Available frequencies:
 [INFO] 800000 1000000 1200000
 [INFO]
 [INFO] Target frequency: 800000 KHz
 [INFO] Actual frequency: 787496 KHz
 [INFO]
 [INFO] Target frequency: 1000000 KHz
 [INFO] Actual frequency: 974996 KHz
 [INFO]
 [INFO] Target frequency: 1200000 KHz
 [INFO] Actual frequency: 1199995 KHz

Regards,
Biju
=20

