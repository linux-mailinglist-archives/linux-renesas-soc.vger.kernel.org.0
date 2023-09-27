Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 672177B0FB9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Sep 2023 01:58:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229789AbjI0X6V (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 Sep 2023 19:58:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjI0X6U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Sep 2023 19:58:20 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2133.outbound.protection.outlook.com [40.107.113.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA509F4;
        Wed, 27 Sep 2023 16:58:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h3jCHZcbvBzzY13MWGBX0mHsZOVHX/2fTQ/Qvq+VfutbEd69h1d8HJCl0BRJ/l0ZLnn4IqPEcHgqN+Uqz2tBpBLTJcAh3DbRvvM0cJwNXPveY3MaQagKZizYxOQSyOY4K4oUMsppk43vmhS4yMRvnhTDiJdgzb/mSB43BiC1wfixESw+PYkXf9x8V5dvrVnEnw689SOvXUikDgLXVyCxAMnn0t1yErhXuP2SBNHf5TieyqxJPoCM6QXyg9ucsH+sZxF/4Es5vBhybDB/4wyNJAOEp3cPzn55vZa0QzTSeuWS4bd6Dpchh0HCInwny1UTDFjRVjg7hlIWdARCOyVbWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RNUGuRlk1gy3e2m/IYOJp9sdVg/L57rKxHq7tfwLd4c=;
 b=I9L+gtYaThoAvKQskujvmkHHSc5xlfgl31kobiCWzySLLTAo85ZMpH4hYg/VRiMIqNZRvU3rNIYFN8FD0FljDteiHkbOMfu7TYR8KZf+2ekJExBpuDDaBEYHqil3O3OpunYzPyXOak9tvKZITan3Qd/cTg+7MRnYdX+5R+fXKfsXTdrbFpX86tYjdsmjGiBwRSZJreL9GUyzxV8Tw+Hl8WqmMhEF7NTtoj3mINEB4KXAuwKPF6NXiLwpBbH/4VIlCM3lF/lrD0gdZzf5+nxAfXeH+7vT58Ent1KY6ZMPmok9HOXjtTTG6Qb8xFevkg1EhpYv0oDjzCbHfzpHru5/pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RNUGuRlk1gy3e2m/IYOJp9sdVg/L57rKxHq7tfwLd4c=;
 b=idEvOo9m1c5awxtCUU9+0gBs+3SgnYnIvGCKq9GI2d6T7duSqbuLnIjtuQb6GBJWkNpeQVbcamMOWjERXwYWFDlNQMBXBM1YCKXn9nw6+cvaxUz3qLC6avd4XpHrrwCHVZq3WhrQHzOnGdYGZjCjZ/kj3QP297cqzJfpRFvGjt8=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYCPR01MB9974.jpnprd01.prod.outlook.com
 (2603:1096:400:1ea::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.22; Wed, 27 Sep
 2023 23:58:13 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::1dc4:e923:9916:c0f7]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::1dc4:e923:9916:c0f7%6]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 23:58:13 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Andrew Lunn <andrew@lunn.ch>
CC:     "s.shtylyov@omp.ru" <s.shtylyov@omp.ru>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "edumazet@google.com" <edumazet@google.com>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "pabeni@redhat.com" <pabeni@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Tam Nguyen <tam.nguyen.xa@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: RE: [PATCH net] net: ethernet: renesas: rswitch Fix PHY station
 management clock setting
Thread-Topic: [PATCH net] net: ethernet: renesas: rswitch Fix PHY station
 management clock setting
Thread-Index: AQHZ70gLPZK+4KBkgE+5y4WMpBuX/7Arl4+AgAEbrPCAAF12gIAAv34QgADInYCAAMUoEA==
Date:   Wed, 27 Sep 2023 23:58:13 +0000
Message-ID: <TYBPR01MB534158160D456DBE947D995CD8C2A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20230925003416.3863560-1-yoshihiro.shimoda.uh@renesas.com>
 <7156d89e-ef72-487f-b7ce-b08be461ec1c@lunn.ch>
 <TYBPR01MB534186322164085E74430B4BD8C3A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
 <496825ea-8d78-47b7-b4c7-f74874ca278c@lunn.ch>
 <TYBPR01MB53419F7AFFF80FAB49C4F92BD8C2A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
 <0bae6059-37b8-427f-b108-86e2834bf334@lunn.ch>
In-Reply-To: <0bae6059-37b8-427f-b108-86e2834bf334@lunn.ch>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|TYCPR01MB9974:EE_
x-ms-office365-filtering-correlation-id: 083c80f4-b521-4cd8-efaf-08dbbfb59c6f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7BcCK5pbS+Djz4Oo2W6/sjNDv6GZYt9L0pkRONcZvM73ce0kHVl6b10n49Js3K9aTHfyT9E7URGbB0ffSLHWcjXDB2MVTbWOuFKgFmZl67yxFo5mdUwWhVSshDzrpks1SYS+sMWFW/d99d/Mwpzoskq+8H7bQXeEpRneHJZpOaQjBoO6u55MIDyKrXJBtqapGqiBIx8gpkMc2XPnE5l1thFsKoC9FZ26RpIUMOTsgtyVHKlhnlCmB0GpXWvD8D0fBhIcKCAOgu47qOyAMqHU6z3FKmeFeEGGSJv0YTTeWaWbb4PR17rQ6HjXt7jw9kVJDkYNhhmRXWIrf/TtLiL78EsBsUR3txHSdN4+FbJFQVhM91vKrgQOZLnE4GTpoj0coUhpxoDya7CdUykh3eFT4WSRAfyUhAq/YJuSdlKPzcyKxbejj07O9pnQAwAcOAlPvVByjmg2r9f5OdQmSIuyfgQrNvdMPB7F/kVxOwKGCbK0nOD8Zs1lq2nqJcFidr1ULOGn6qoiXa2G9l3PI6sT0YycjGALFSXbfZpeeR7xg0AJ5jc8zI5G1APVn3g2M8tK3yXa12ouDs+KS0SOx7srMlxW/LsAot6jv6MZk8crPo2dr0N3Zyrdxwhds9WIvSCM
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(366004)(39860400002)(396003)(376002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(8936002)(52536014)(4326008)(8676002)(41300700001)(5660300002)(6506007)(66446008)(64756008)(66476007)(6916009)(66946007)(76116006)(71200400001)(478600001)(316002)(54906003)(107886003)(7696005)(9686003)(66556008)(2906002)(83380400001)(38100700002)(38070700005)(122000001)(33656002)(86362001)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?29Op8Oxa4RxN8AziIFc6WewiGp0sQ5vsC7SMW0p0tPIlh5bdufyvv1JNokPY?=
 =?us-ascii?Q?nHW3HQN0HiL3uVD1dSFZ6nMaF4YqjrPKuslHBtgo8/nW7WKfV9t24vZNN5qu?=
 =?us-ascii?Q?15zpZXv2PS7yt2nsZWXqu7tH1xIJ/UQvMQZts1Ufvtpl8dUdEu/wqvAnHjSv?=
 =?us-ascii?Q?ncwZSJPKJDupSmakzyEcWtdzBJi+MuqvtDw36SSp8bTRTj68ul+Z6G0/kGQz?=
 =?us-ascii?Q?dJNmImtUtE3+DQlT9JM9pMoqJWLMXR/gqOCdor9gE6bUuPwrJnPgnozC+RJE?=
 =?us-ascii?Q?sAbLWCQi1JBO1T7GGRWRHP+0iRUU/lqUyqENDwc/dSkJSHIY711fF1e1u7PR?=
 =?us-ascii?Q?YkzTWve8F7YwLuZ1zFXyAHzZL2jru99yRgkjav4oMaC5U26Fcgr5BOyER9QV?=
 =?us-ascii?Q?GeDwY/pooik10Huj70ApF87XiiHMnVPrv0P+VsPCnmJUFDyx2s+3SXvvcixK?=
 =?us-ascii?Q?MmajQaY8FFCp/KcC9ZeK/FuOT/kTUAKub+f6PdPVfmtfuxqxcQaRsLwq00ul?=
 =?us-ascii?Q?BXsN1QXSOMjzgMYg3LyrT8rBpsbyycJYWgqYbIOf1DSFCxfzwINsjDcGQKNo?=
 =?us-ascii?Q?9RL4DIcj8rzX2DISgRoeKacyDni9gql2r6ybU4cyyz/8l/V2bsvqxL+6KRkz?=
 =?us-ascii?Q?B8NzQGC5mJ0UwM9nX1GXjizhvJQmTKTqjG+dzvpBfJML6MgiAfrNQgD3kIK6?=
 =?us-ascii?Q?0PsEy1v1gHcQctv/verLHcDSdzOr5iObrvlasP5qcx+7jih7VoDyifPznnR8?=
 =?us-ascii?Q?WX0DSZCt6HToBtaesBp8nEwyqjyqJWvUSju56qzf1U++O24IlKEY7z/orSsf?=
 =?us-ascii?Q?+lyBe4397jfDTtfxjACB9FGu7X16kHk0U6wsYvmYLajFt5n9DhlybXrJTavg?=
 =?us-ascii?Q?k7vxY74RDsCyHYa+dHG/w3XXi5wV6G5D1OiKJRFto74dMdooZ4xVYeRrcZu3?=
 =?us-ascii?Q?NMctYXbkk6LVFDNFnfNdwhKVuoM/vr3cJ47lBUAh8CGosBv2Jlqqrz4IKBtU?=
 =?us-ascii?Q?Sm68mFpPmTCC4fZ8FbRc3MxjTApyfik2vL7JsKpse6M5H9waOu9qip9MawwS?=
 =?us-ascii?Q?hIRDEO1Ag5ZiBgmOtMRVy4Qyk6w5wxoIf6dcCWhh3PpZeTVQ++GaPYCoY+xM?=
 =?us-ascii?Q?zzvS7ZBreQbfxiWnOo1A8mEWz6H2+wo9L87gk/1UX16MQwQ8t8gapJn4AQHF?=
 =?us-ascii?Q?LuBGlEmdfFtxDz2oOZupz48wAtwL+d8wfIG2rKf3bLde0dcmmJ9QZHVBYJuY?=
 =?us-ascii?Q?J98m9RAyNXo3MtidVIDqplxItvr/g2SV7xNfFBdw0Lkmt5MgAGWpDaCEmefe?=
 =?us-ascii?Q?po4TvFlgOcZynzyDG3GpznFZrMME8lKPcsxq3u7OjVsTx6hLqM2ruK9X0z3f?=
 =?us-ascii?Q?BKXs4EVFihpgYPmLrzCYZN3ahIZYJuGrVB+CLukIFSO9zmcS0FpG05mV5kM6?=
 =?us-ascii?Q?EN5mY0it5baOWSlN9SnhMVva6hLFMdxbEHYTqw5/cSB+aLG1YzgDRDbPg3yj?=
 =?us-ascii?Q?W13T9spetzcYtetRV42om0U1kYkJWb7aRK/woMvXk1dhM20+m+ueMVXsk4NU?=
 =?us-ascii?Q?Vz3gweYmb2PT38MrjBJ6t/QfSJgKd719Wr+EUOnjBDLaMMPY0pRNVVNfuW2r?=
 =?us-ascii?Q?QRhVHBMvRckgexPm3HR5EA8tDglTvx/2yF7YJUJZ3qlRhTj3axhGJruaHXpf?=
 =?us-ascii?Q?uavHWg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 083c80f4-b521-4cd8-efaf-08dbbfb59c6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2023 23:58:13.7302
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rk3UQOUC4NOhYZmA40BbqlhJnGVJquW5HmRXJ52ipT24VSShm9V7SvUGXvNZNyVYHw2ItElek9tNbbTgLENpeCWfYCGbQfSz1PS4HyXjAN6xDZsuZxZygycFhXejXEfD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9974
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Andrew,

> From: Andrew Lunn, Sent: Wednesday, September 27, 2023 9:11 PM
>=20
> > Yes, the original version was tested on Spider board.
> > The original version's MDC frequency was 25MHz.
> > And the PHY (Marvell 88E2110) on Spider board can use such frequency,
> > IIUC because the MDC period is 35 ns (so 28.57143MHz).
>=20
> 25MHz is way above anything i've tested.
>=20
> > However, I don't know why this setting cannot work on the Starter Kit b=
oard
> > because the board also has the same PHY. I guess that this is related t=
o
> > board design, especially voltage of I/O (Spider =3D 1.8V, Starter Kit =
=3D 3.3V).
>=20
> I've had boards which will not work at 2.5Mhz until the pull up
> resistor was changed to make the waveform compliant. So it probably is
> related to the board.

I got it.

> > Anyway, changing the MDC frequency from 25MHz to 2.5MHz works correctly=
 on
> > both Spider and Starter Kit. So, I would like to apply the v3 patch [1]=
 for safe.
>=20
> O.K. That makes sense. If you want to support the higher speed, you
> could implement the device tree property:
>=20
>=20
>   clock-frequency:
>     description:
>       Desired MDIO bus clock frequency in Hz. Values greater than IEEE 80=
2.3
>       defined 2.5MHz should only be used when all devices on the bus supp=
ort
>       the given clock speed.

Thank you for the information. If I need to support the higher speed,
I'll implement such a code with this device tree property.

Best regards,
Yoshihiro Shimoda

> 	Andrew
