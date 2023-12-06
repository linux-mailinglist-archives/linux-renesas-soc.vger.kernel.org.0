Return-Path: <linux-renesas-soc+bounces-757-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 42811806AC2
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Dec 2023 10:33:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5103281986
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Dec 2023 09:33:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ACF71A705;
	Wed,  6 Dec 2023 09:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="NoO6f+HI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2090.outbound.protection.outlook.com [40.107.113.90])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73153A4;
	Wed,  6 Dec 2023 01:33:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m9O3jlRqvc8WGY3tt51vprM4ZulOGT6AwKS2qRxNbRdjj41Fg+Y9CRyfvTBinejAIODiWpgzfJtmVB4GXiMJb+d5NytVw+3r0F0eQLng8NCKbaoYv5yRZ0jahUJdGnf8XVK+CpzEEV/B+1mIEJdhkxY9sB1+leFKs9CX7OqyAt0pERSBfgCDjKViqg6GwyxDhxmTDTUld99fRCN/xXXC6jXXYhGLdHe+zdkeZVHgzXdMMyKhBU1RWMJ4SAczxqzgW7LAU4S3kFy5PDvwxgNKTQUvdN9Wrr09ixrim1KRGgQM3cY754AR0ZRDRXiWyUlFbhCvJ0DggNEISJpRzoa2oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FRoLH6vwVxk5mkSW7aaVwi15TGHLqHZccsx/tZvYIMo=;
 b=e1riIEU1E5my+dmKEJgC4WEsXJeiLDNbypc7IOrYHqkc8A2qXwkhceznjxRK+hEpO1LCef55d6ibGCsbU2cBCfEyfRNBOuT7CS596nwGH4kYMgohsS6t+avyTe7XkS+NAE/xf8xSv/Bi8IvjyCZ1x6ekIgJERNLF3qsAky8NJz2RCuSQUvEmEeCOUr4qm2gX2l+vWkDgAkx0rGjjYOqwBKtNBB8/FGlbY7elbrYAr5RRGe18XPL/B23vzgUtel1zOaLzGZpWWTWXGoes+Q3eUijUqMkAHV5lGhq8o6gbDdpTpoisE69PGEKtbP4iiuvZS/R1JogvjsaaGUWXZd2H7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FRoLH6vwVxk5mkSW7aaVwi15TGHLqHZccsx/tZvYIMo=;
 b=NoO6f+HIvSiPyqDKDk0Ad/nDUBN8hMT5jiLvo/TyMMH/MHUKiX3yVlc3YkZoz6Hzx7TrPJIf2R6JT+iror3pfIOJ4z7MCLcapYR83vZRHrtv61Bd2LvgOVh99n+ublw82/5Pgm+tFrul7XWzx4A0iRCWVVTSVZb0O3ygiGu3Law=
Received: from TYVPR01MB11279.jpnprd01.prod.outlook.com
 (2603:1096:400:366::13) by TYWPR01MB8759.jpnprd01.prod.outlook.com
 (2603:1096:400:16d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Wed, 6 Dec
 2023 09:33:40 +0000
Received: from TYVPR01MB11279.jpnprd01.prod.outlook.com
 ([fe80::db2e:9e88:68f8:486b]) by TYVPR01MB11279.jpnprd01.prod.outlook.com
 ([fe80::db2e:9e88:68f8:486b%4]) with mapi id 15.20.7068.025; Wed, 6 Dec 2023
 09:33:40 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: kernel test robot <lkp@intel.com>, Lee Jones <lee@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, Support
 Opensource <support.opensource@diasemi.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 4/6] dt-bindings: mfd: Convert da9062 to json-schema
Thread-Topic: [PATCH 4/6] dt-bindings: mfd: Convert da9062 to json-schema
Thread-Index: AQHaJEbLbkLjDyc/Rk+ATYqnJ+1Y7rCbvd2AgABG8QA=
Date: Wed, 6 Dec 2023 09:33:40 +0000
Message-ID:
 <TYVPR01MB11279FA6949EFAE62C70EB2948684A@TYVPR01MB11279.jpnprd01.prod.outlook.com>
References: <20231201110840.37408-5-biju.das.jz@bp.renesas.com>
 <202312061323.Zk81yCZU-lkp@intel.com>
In-Reply-To: <202312061323.Zk81yCZU-lkp@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYVPR01MB11279:EE_|TYWPR01MB8759:EE_
x-ms-office365-filtering-correlation-id: a5568960-e81f-4bec-93a8-08dbf63e6e58
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ZHi87aMFJZmFR7C6ALYC8TTo6i4R3/BKo/yVpzQh6n6Nbz7X02eiYwvFksEn8K+PIbFejQi6oLZC5lYEc5nPgbeC2pJ9pVOERrGzgrieZDMfZkD1TjoDxqFrtJeOklhRPsBzcYDjshhMtZ/THY1/N6ClVCJKaj3QUf9ySfxMX4ANsFRMmFt4YU6ACW2oUbwKKHPLAguynkKM9bqFQvmXNv+rBm+MHS+AsR1NdiC4FERFJ1aoqxfp6dTBQO85LzGHwKpsTOpX/XdccWEPrcVlzQiHWtWEni4veBCxwWfKD+3VmxqhbfSrDpveU2isuO8AwuwsMXeSvDMqgVDVEF06hUiU+RAOQd57q04amjg8E+89zdtWLBGzXhz68jqVfsmHEOTFbQgyi67Vd5oSOCilM6RdXGVboPdvZr2xo7clfep0ppC1RXQz/+cppg41EkzKmxeYglHf56t5zWdDh2L3HJ/3FHbjOdhGKW5kZYoHzR3/RpKC2ZyQMfVDqGVexPrJ7JqVMNDNilDH+fY/vL88Kz9AD47R5y65BYYMf0Xw/wjfhwqsf3ptugMOy0uv8KM6+8l4AKWrxm3rQ+iMzksFb7E/66q+HzkeTaxsNLqXx0trW3ZUNjtgWxkF7vSq8VTKGKuCE4XMPSf4zGx4kvtOFA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYVPR01MB11279.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(366004)(136003)(396003)(376002)(230173577357003)(230273577357003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(26005)(52536014)(38070700009)(122000001)(55016003)(6506007)(7696005)(86362001)(33656002)(41300700001)(71200400001)(478600001)(966005)(9686003)(64756008)(66476007)(66446008)(316002)(66556008)(76116006)(66946007)(110136005)(38100700002)(2906002)(8936002)(8676002)(4326008)(7416002)(5660300002)(4744005)(54906003)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?4FemblMBZBH9GMcEutk2XngekQO+g9QstNSUSEfpVdgIzKU9DOU9FtFeVh92?=
 =?us-ascii?Q?nJALulkoT4tq2beCUpK0CI4A6t7sxKKwmK7Vpy4LqEQU2y9EquS6GQPbcq5B?=
 =?us-ascii?Q?rkfb0AWvKWEgqVVP1687jGsO0s6pNSMVpY07LdkUxgDSKytX67oO26fGqq9L?=
 =?us-ascii?Q?SIjWXDvqVmBJjx+afifTEEREPXhwCKZPzOPy57eT+yNhEAuBLEQosMWj1q5t?=
 =?us-ascii?Q?jNd1VXzOFPQEGCdNhShrtCbN7B7Y5Zth4rzvDma7+5pqLJEczLW9MTdVpXpy?=
 =?us-ascii?Q?541Rg04fRLkUx/V2CC/zcpPCSOc+FRDDo2CIRgA13s0+C9BmxWneWhXvCwmS?=
 =?us-ascii?Q?WGLOdBOcKsu/Wu3bew/l2faPGX7QizY9LS9/xJDADgE5yV7Ff8IFSxogb0Zk?=
 =?us-ascii?Q?ab/2DXnC0KIMnkB9XZOelsiPNNxw95xgkqbtEZcvMY0DPfGxhSI1CsALwfFy?=
 =?us-ascii?Q?myhlvv9p+ADRCVRs9iHY7EBKPqID1kIMU6aQRVdCI/8rj/xauz3BGEokJCEC?=
 =?us-ascii?Q?HPwP26JR2P9QRVq0iA2usZZ9AkXwmsYazVnueBwlXDZIuuuQX081tktYtNXY?=
 =?us-ascii?Q?QEGZx0KbwJgcPZIA8lRg6WOTTH7I98d6KBrOpLg+fDTI3rxmw+dS0y/s3GN7?=
 =?us-ascii?Q?r82PMgJVhonN9CTlUNJb6SsyfUGV+eCChzc82rt/JVQ/qKHmfXZ8bAd2xW/4?=
 =?us-ascii?Q?WBVKtWnWxxmKY14lLjyf8vx/SX47amNSYKfJkZjmlGgYGrMUJRryEl/JlZM9?=
 =?us-ascii?Q?FknIlcpSOZ9H0pc8ZRl/CkUhDpF2ao66tWrjbqIGnadt7fJMDdLojdK0x5LH?=
 =?us-ascii?Q?nXLR5ZkO9HW5cwLk+a0cJFvLPSdC7j9GwI211vs5cSfHoZvByQ+Ldl/NjhzG?=
 =?us-ascii?Q?c/ht5dLAn5D1CTJse8haI7q1C4OH1RBTSijk0Z3AfBe9OCs0NQn0LEIp78hj?=
 =?us-ascii?Q?e6JB3bTtPwdEZXBmOJWNemgqz5nYUEM3LgnBywNHTdn8Z+LdVJMZpl7RlYNJ?=
 =?us-ascii?Q?E8Y6N2KQxbrNb3bDT63hfJs6JukycdbbCLrkWaJrF0l/U7RLSvR2cC/78XzC?=
 =?us-ascii?Q?sJVGD8FaeCRLMjnIQDNYrJ84FAP8sybWEajN+wzld6VB6rK8ySthGQABFF3A?=
 =?us-ascii?Q?9wBlRCfzXnW2Ul+yvltBu/7nPGp6TBSSwoUTUmsPQrIWpuVgcHMPY2ltdVSh?=
 =?us-ascii?Q?vZpzjvjq1Bfigw8S0c6uSQm1QJvb+YX/qjhVs/50/vFN03ov23OzYTgmC/c9?=
 =?us-ascii?Q?dgTK2pySoturio+XN+gpeAozhgvi+evJidElJz39d1ANlqAbCJ7/1nN9Ixa2?=
 =?us-ascii?Q?ASfEv6a68jXLYwQo0Gqx2F6QaXLz8qJxfHtZXgGc+IfIAcLRoigy7aOGP+2Q?=
 =?us-ascii?Q?Rk+qgk41zyyIi6KEUv/MHYVYIaMZp9aSc9R/sNEzVVHmeY8rRX/9hq7NU5Nh?=
 =?us-ascii?Q?vPXSpwR40fft/4tZZR6oFWQ43LhdCjQra9t76LJA3MDjW9bpibQ3GAj/rjmR?=
 =?us-ascii?Q?GLyEQz30khVL/fci3rkNvTHlUsQHp2hymk3tTQDt4ZZiIOaHAwB6CMDdbBCO?=
 =?us-ascii?Q?1+oT0hQJXy2jiSS/VmOQagQVhGIkc0ZXT6XMbTHzAfTVqQ+f9Fp0zlfVOBDj?=
 =?us-ascii?Q?1w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYVPR01MB11279.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5568960-e81f-4bec-93a8-08dbf63e6e58
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2023 09:33:40.2200
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W8o5i1k5+xY+qFyT2K4/XjxAnweFXh4qaLX2X6cJHM0f9H71zgFj0ELzEEN0IhiWTplNMgjrj5MlrmkEZKwkITYcegaTNHPIZPdj1IYaBVE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8759

Hi kernel test robot,

> -----Original Message-----
> From: kernel test robot <lkp@intel.com>
> Subject: Re: [PATCH 4/6] dt-bindings: mfd: Convert da9062 to json-schema
>=20
> Hi Biju,
>=20
> kernel test robot noticed the following build warnings:
>=20
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new
> version of the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes:
>=20
> All warnings (new ones prefixed by >>):
>=20
> >> Warning: Documentation/devicetree/bindings/input/da9062-onkey.txt
> >> references a file that doesn't exist:
> >> Documentation/devicetree/bindings/mfd/da9062.txt
> >> Warning: Documentation/devicetree/bindings/thermal/da9062-thermal.txt
> >> references a file that doesn't exist:
> >> Documentation/devicetree/bindings/mfd/da9062.txt
>=20

There is an updated patch series available[1] and Please retest and
provide feedback if any?

[1] https://lore.kernel.org/all/20231204172510.35041-1-biju.das.jz@bp.renes=
as.com/

Cheers,
Biju


