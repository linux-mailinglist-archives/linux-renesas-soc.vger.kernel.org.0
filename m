Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B56B1657251
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Dec 2022 04:32:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbiL1Db7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Dec 2022 22:31:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbiL1Db6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Dec 2022 22:31:58 -0500
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2047.outbound.protection.outlook.com [40.107.22.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 785612ACA;
        Tue, 27 Dec 2022 19:31:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MLnJ2rZESOkd3kfh/ydCSOc/t/doTe2bgvNq9pnMlwjKKUiJ4CxNqKGtKcgT/kc3KL4A9e1ZUI0FK92ADBhjVEYttBwRaz5oTz/HKmUiiYu5rj189vpk2x+VUSFDFzBXxzrVV/SIrLtcCL03fmTcVA+/cjzRZDQGhxqITxTO58qx4/jDCI+hM4x34VN+Sn0XIt9ASiA8W2Xz8nqAB0ZjYqHWkTRP7muR/GMn9FvQ1GbRoZvMq7BKFLPSCciR+jC9/HX2n0ng7xJy6awHhiW6R+4IEeJii0M3KRoFELdM6S0O7iN/yg9y/NgL8eKM4g+BBXS2IzuAD9zYKArQ7RwJfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M9iCkJKMm/NdZWRWc+AG06jazPuuCVuTPYTYA5g6Vws=;
 b=fVjqGwBwG8oKJh/jtg3IQ442fanOHHwxEru1EA+033PXemCYgqH4OQybAQDuxl22O7NuUvXzMkilnwn02i6Nl1eAk2ZVCyvY8qTvFm+faQpmNvfrmXa9iEJF6O+ByoWV0vlEnid+iIdGnYLZgEVWNpD1FehAZ8D3BAbD6NeX8pKQdA6zGLKOUy0Dr4uXxA8QDvSI+xLzYAoqIkrRKfjQAsogCi9rQoLyZAWonEM8sxv2/HErwxMJvE6tyurn7lshdBSy7ob2uTEs8cY4LGNncfY1UEtjHUWCXrrwfkURMSh1jgD91eDOzqMBlorgn+n0Y+J+7vHgKPxtm3Yhrx4hXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M9iCkJKMm/NdZWRWc+AG06jazPuuCVuTPYTYA5g6Vws=;
 b=PvYZ8ElfBHD6Gq0n7rE76wqX2ADynpi+iZ3nlGjLtmruDXhRWMmKzOKJ5HbKfvknMx2U09CYI2GbraxNA0NjHUdKQQd3Go4oLQoFCetkHwJX55/hrJC6dtGSjQkU8goRb6qhCHLba033StQy6olzONRRdDNZKRSNAfpT9Bxo5Ug=
Received: from DB9PR04MB8106.eurprd04.prod.outlook.com (2603:10a6:10:24b::13)
 by VI1PR04MB6861.eurprd04.prod.outlook.com (2603:10a6:803:13c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Wed, 28 Dec
 2022 03:31:53 +0000
Received: from DB9PR04MB8106.eurprd04.prod.outlook.com
 ([fe80::e9c1:3e78:4fc8:9b24]) by DB9PR04MB8106.eurprd04.prod.outlook.com
 ([fe80::e9c1:3e78:4fc8:9b24%9]) with mapi id 15.20.5944.016; Wed, 28 Dec 2022
 03:31:53 +0000
From:   Wei Fang <wei.fang@nxp.com>
To:     Michael Walle <michael@walle.cc>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Shenwei Wang <shenwei.wang@nxp.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Landen Chao <Landen.Chao@mediatek.com>,
        DENG Qingfang <dqfext@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
CC:     "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>, Andrew Lunn <andrew@lunn.ch>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: RE: [PATCH RFC net-next v2 09/12] net: ethernet: freescale: fec:
 Separate C22 and C45 transactions for xgmac
Thread-Topic: [PATCH RFC net-next v2 09/12] net: ethernet: freescale: fec:
 Separate C22 and C45 transactions for xgmac
Thread-Index: AQHZGkgADeuvJk/rT0yUMCeDaP0DQK6CpIaA
Date:   Wed, 28 Dec 2022 03:31:53 +0000
Message-ID: <DB9PR04MB8106662C6101FD0C2B35104888F29@DB9PR04MB8106.eurprd04.prod.outlook.com>
References: <20221227-v6-2-rc1-c45-seperation-v2-0-ddb37710e5a7@walle.cc>
 <20221227-v6-2-rc1-c45-seperation-v2-9-ddb37710e5a7@walle.cc>
In-Reply-To: <20221227-v6-2-rc1-c45-seperation-v2-9-ddb37710e5a7@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR04MB8106:EE_|VI1PR04MB6861:EE_
x-ms-office365-filtering-correlation-id: e5d7b7ad-9f84-4c33-5f06-08dae884106d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Dw1OsFJGKDwK+kPpJvdnMe0dsbFZD+JDbfBv2ojhGb8mWY7bHxBXbm6lM5TWDNYSJgq5SGVv576e71jdfQB02DTUAWxttVAGn+vgNAdN5S+BNktWtK8gplAmZpDCXQuQdi90uu3qruV8TNJQoKhhgFCoyyESBrWhyoxRUzzZf3cLVDAk79ofUnKhN8tRMZ1uNp5DtJneBeGnlS3kWKiuiA8WdBrwheUOxYAnbVxuDBN7C/XIm8gUHet0dZXb4Q0EWH69PrRUFnh27lPZubhLwlX3gAiVTWqHZFn63cZKFJO8LT8Vnj8O0deZUrvPxA9KRDXegN9WpIwqOg/UIOQXQdodA4qtl9ZwWvTvCkp9YVLIOr9mrJWKsttAWvqnTqjTqr9fMXf5Cam/Pi4NVkoSF24vHohupdj/plLimh/NdqjsVWrSnQiAqmDVXMlktaXkyP1jR95+D+PR9I8asWPaHdvR+eAxHD3NwZlW2592jmEh10UZxXuVUKjbACkL/YT/VWhZ+X0gArxF5BBhidM10PcpKaDE07wBqWzAbumoNwd3UbspZnTsKLV1iDYVHAtcxQnkeNw0LjJu9UN8UU+Y5ZIFsHgRi93Y+E21bkfL5q89hyUYOgD2ooTUWRWY57omcNY9oc98pJSGOT3pKvZDHs1CSzpscRI+/ovsMeNZY7EYLxumlNaACy/r/RIdtiG0/gc7zujlMA7TQ1kWBnqgy8wA9QHnKpd126uPRWB3KUU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8106.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(396003)(346002)(376002)(136003)(451199015)(66946007)(41300700001)(66476007)(64756008)(4326008)(8676002)(86362001)(76116006)(55016003)(66446008)(66556008)(8936002)(52536014)(5660300002)(7416002)(44832011)(316002)(110136005)(54906003)(33656002)(83380400001)(71200400001)(2906002)(478600001)(921005)(38070700005)(26005)(6506007)(7696005)(53546011)(9686003)(38100700002)(186003)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MW1hSjdCdG45RWhFVm5BWC9VUnJzc09mV1N4SkdCRXJOSStEc01Odzh6Rkp1?=
 =?utf-8?B?UDZEVE8zNk1oenF2QWNTWXNiZHpZZVprcDFXcWd2b2tJM1UzdVZScEFNM2Rp?=
 =?utf-8?B?czRoelFHRHhRSFpWZ2JSRmpmS1VtZVdGeEg2dzZVSXM4Z1hjQnRLUmlENW9X?=
 =?utf-8?B?ajRSVmZqbjNaU3hCSUdJb0N1OWJPcXJqOFA4RFNuaVF4aGloRjdLaHRYRlcr?=
 =?utf-8?B?cjlXbm1OZjQ1OUgxLytFVElLMVV6UmNnd0NXWjl0WFhLdkZURnVJc1Jma1B2?=
 =?utf-8?B?Tmt4SjB3U0EzY3gyZHdXTzdIZWN3ZnRmRENjYkVSako5dGtYQ1pLUjBzN1F4?=
 =?utf-8?B?anIzY3dkQXQ0aFU3ckVONW9JY200MTh2STl3anFRRm5IZjFwOXdBQjRyK3Vo?=
 =?utf-8?B?bkZhcEt6Q3lLbWhmcWN4dExiVDdLVEVrZk03L211dllFeEVXQkZpTmtBdUd1?=
 =?utf-8?B?dlBLWkpwQmdDYkl4MlFYVFd0Zm8yMkwzZE9wK25STmZPMkp6TERJaXAxek9T?=
 =?utf-8?B?ZWxkV2h6NzlCRXBjR1JxYlpvV0x6UkNBUWtuQTRyejFWK2Y5dkZSbFpOY2Zr?=
 =?utf-8?B?SzZHLzQrcDlYK2t2bTRpRWtlRXFTK014cWU3dE1BbXQwaEMveGtERWE5V3F1?=
 =?utf-8?B?UjBBUEN0eGtObm1Zc0M3RTVGQXdCdEpTQkxXNVUrK3djbTU2U2lIU1FaTTVB?=
 =?utf-8?B?bmVTYnZvN1M5SFozaEtmTXVSQUppSjNublBSbnZMMjBUSjFtZllRL0JScXd4?=
 =?utf-8?B?dHo5cncraCszcEdBRWhIN1dHQ1MvSEQva3ZQQ3NsNFRrRTVnUlkvNEJyYTBR?=
 =?utf-8?B?cUNhS1pXVUUzdXRhK0V1bDM0VEIzV0EvcmkvUDlOWFVVZlU3ZDR4NmNOY2VD?=
 =?utf-8?B?RUpUVjlBVjZheUwwVTB1SFRPVzltWi9zd2xIUjJQdXlNcGtid0R5cGpJQ3Bu?=
 =?utf-8?B?RVBmVTNhY24yaklnYWxZWldYL2U5RXNGZVdjcHRoNTZlSUdubmxSTnpvWXpJ?=
 =?utf-8?B?dGpJcEpaTFo2QkVKbzlTREhmQWhYMmxnSTdqbDJMamlxQXdyS2Q4S0YwdXBF?=
 =?utf-8?B?ZUZNSUNjUGE3aUQwKzFsNGdKRHlYZjJPZTlrZi90K1EyV05kRlRoQ2EzYjVs?=
 =?utf-8?B?U1FLT1diTEFKT0hKek9rWkN5QXdQTy9wNmVHdTFOWHN3R05LckJVU0E0bTRj?=
 =?utf-8?B?MVpJdWttNk0xQmFIRmFoVnY3QWlzbDZCQnZLL3lFbmZZZG9uSkxXTWdXTW91?=
 =?utf-8?B?Y0o3ZXZpNEpzeE55QzdsVHp3WjkxWnFpTnhNY1pEakdMcmIzL0lSVDVESjJV?=
 =?utf-8?B?cnFLWnhUbGNWQ2RmejhnS0hIR3Z3b1V1YUVEMjg1K2dnMEpwSll5RlVaSGF5?=
 =?utf-8?B?N0pwUnBzckN2Z0Zuc2c3WXhZT2ZELzBCWVQyT0JCYWRRbVp4bkd3Vk00d1ZK?=
 =?utf-8?B?Y0dZWTIrRzRSSnN0Sk5JczFNSWVzWHU3R0lDNUk4WU02OEVjWGxCcU1mell2?=
 =?utf-8?B?UGlsL0srek5WMFkwdnNDa3JPSWJBaWhkblFkVTRkTW9WcjI0VWMxOTRzb3RV?=
 =?utf-8?B?M0tjQkNNemU0RzRiY0JTOEVLWlBvMU11Z0pFZW5WREQzc0JqVDZ3eG5oNm02?=
 =?utf-8?B?cHJhVXBna0JLa3NZYkpMZ1hRbXJiOThBN1NVaGpCQnQvZDZFN2l0QzZueTVF?=
 =?utf-8?B?dDRRNThpT1JjMFhYc0c1MlBoZldOUTZiWUhwVkxUOHFEcjZacXJKNk5SSU90?=
 =?utf-8?B?RHFOK29yTkNDOWwvQU9sRmxHTGxqRDJ3REh3SDlYTk1Sam9GNVA3UDFjU091?=
 =?utf-8?B?U3VBM3FXWm1kS3lkZWFQL3dzcW5MSHJFL1V4bFoyTEllL0F0VDNVWXBTbEdo?=
 =?utf-8?B?cU1ZbDJTa2M1dkRxWlNvZTdFY2x3cVc0cFBGaUJwZkNvUUFaWHpjMThUMUNG?=
 =?utf-8?B?UHZ3R2VNVXliMjdjTEF2dXk1RERad2dqTEYxVmZRVGN3MXRZNTNtdkdvTWRU?=
 =?utf-8?B?SDFBdFd5NXZSem1seUpUK2VBRC9McWIzV1FkSitMVTBNajZDSjdHSzQxdUtB?=
 =?utf-8?B?UTU4VkhCYXY2aTZLL3lYTFJzWlIybEQ1cis2OE9ZWFY5NVZrb3pjOVpuOWNF?=
 =?utf-8?Q?TCW0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8106.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5d7b7ad-9f84-4c33-5f06-08dae884106d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Dec 2022 03:31:53.4964
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QdgENPme6DB9yAiimCZgAshYFIosBAqH0fofc7DNNhEy/NxPwi1dU2+CHjlLikjC68+xrjn80JMTUfSfGQMtjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6861
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNaWNoYWVsIFdhbGxlIDxtaWNo
YWVsQHdhbGxlLmNjPg0KPiBTZW50OiAyMDIy5bm0MTLmnIgyOOaXpSA3OjA3DQo+IFRvOiBIZWlu
ZXIgS2FsbHdlaXQgPGhrYWxsd2VpdDFAZ21haWwuY29tPjsgUnVzc2VsbCBLaW5nDQo+IDxsaW51
eEBhcm1saW51eC5vcmcudWs+OyBEYXZpZCBTLiBNaWxsZXIgPGRhdmVtQGRhdmVtbG9mdC5uZXQ+
OyBFcmljDQo+IER1bWF6ZXQgPGVkdW1hemV0QGdvb2dsZS5jb20+OyBKYWt1YiBLaWNpbnNraSA8
a3ViYUBrZXJuZWwub3JnPjsgUGFvbG8NCj4gQWJlbmkgPHBhYmVuaUByZWRoYXQuY29tPjsgSm9z
ZSBBYnJldSA8Sm9zZS5BYnJldUBzeW5vcHN5cy5jb20+Ow0KPiBTZXJnZXkgU2h0eWx5b3YgPHMu
c2h0eWx5b3ZAb21wLnJ1PjsgV2VpIEZhbmcgPHdlaS5mYW5nQG54cC5jb20+Ow0KPiBTaGVud2Vp
IFdhbmcgPHNoZW53ZWkud2FuZ0BueHAuY29tPjsgQ2xhcmsgV2FuZw0KPiA8eGlhb25pbmcud2Fu
Z0BueHAuY29tPjsgZGwtbGludXgtaW14IDxsaW51eC1pbXhAbnhwLmNvbT47IFNlYW4gV2FuZw0K
PiA8c2Vhbi53YW5nQG1lZGlhdGVrLmNvbT47IExhbmRlbiBDaGFvIDxMYW5kZW4uQ2hhb0BtZWRp
YXRlay5jb20+Ow0KPiBERU5HIFFpbmdmYW5nIDxkcWZleHRAZ21haWwuY29tPjsgRmxvcmlhbiBG
YWluZWxsaSA8Zi5mYWluZWxsaUBnbWFpbC5jb20+Ow0KPiBWbGFkaW1pciBPbHRlYW4gPG9sdGVh
bnZAZ21haWwuY29tPjsgTWF0dGhpYXMgQnJ1Z2dlcg0KPiA8bWF0dGhpYXMuYmdnQGdtYWlsLmNv
bT4NCj4gQ2M6IG5ldGRldkB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5l
bC5vcmc7DQo+IGxpbnV4LXJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZzsgbGludXgtYXJtLWtl
cm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOw0KPiBsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRl
YWQub3JnOyBBbmRyZXcgTHVubiA8YW5kcmV3QGx1bm4uY2g+OyBHZWVydA0KPiBVeXR0ZXJob2V2
ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPjsgTWljaGFlbCBXYWxsZSA8bWljaGFlbEB3YWxs
ZS5jYz4NCj4gU3ViamVjdDogW1BBVENIIFJGQyBuZXQtbmV4dCB2MiAwOS8xMl0gbmV0OiBldGhl
cm5ldDogZnJlZXNjYWxlOiBmZWM6IFNlcGFyYXRlDQo+IEMyMiBhbmQgQzQ1IHRyYW5zYWN0aW9u
cyBmb3IgeGdtYWMNCj4gDQo+IEZyb206IEFuZHJldyBMdW5uIDxhbmRyZXdAbHVubi5jaD4NCj4g
DQo+IFRoZSBmZWMgTURJTyBidXMgZHJpdmVyIGNhbiBwZXJmb3JtIGJvdGggQzIyIGFuZCBDNDUg
dHJhbnNmZXJzLg0KPiBDcmVhdGUgc2VwYXJhdGUgZnVuY3Rpb25zIGZvciBlYWNoIGFuZCByZWdp
c3RlciB0aGUgQzQ1IHZlcnNpb25zIHVzaW5nDQo+IHRoZSBuZXcgQVBJIGNhbGxzIHdoZXJlIGFw
cHJvcHJpYXRlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IEx1bm4gPGFuZHJld0BsdW5u
LmNoPg0KPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFdhbGxlIDxtaWNoYWVsQHdhbGxlLmNjPg0K
PiAtLS0NCj4gdjI6DQo+ICAtIFthbF0gRml4dXAgc29tZSBpbmRlbnRhdGlvbg0KPiAtLS0NCj4g
IGRyaXZlcnMvbmV0L2V0aGVybmV0L2ZyZWVzY2FsZS9mZWNfbWFpbi5jIHwgMTUzDQo+ICsrKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEwMyBpbnNlcnRp
b25zKCspLCA1MCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9l
dGhlcm5ldC9mcmVlc2NhbGUvZmVjX21haW4uYw0KPiBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L2Zy
ZWVzY2FsZS9mZWNfbWFpbi5jDQo+IGluZGV4IDY0NGYzYzk2MzczMC4uZTYyMzhlNTM5NDBkIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9mcmVlc2NhbGUvZmVjX21haW4uYw0K
PiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9mcmVlc2NhbGUvZmVjX21haW4uYw0KPiBAQCAt
MTk4Nyw0NyArMTk4Nyw3NCBAQCBzdGF0aWMgaW50IGZlY19lbmV0X21kaW9fd2FpdChzdHJ1Y3QN
Cj4gZmVjX2VuZXRfcHJpdmF0ZSAqZmVwKQ0KPiAgCXJldHVybiByZXQ7DQo+ICB9DQo+IA0KPiAt
c3RhdGljIGludCBmZWNfZW5ldF9tZGlvX3JlYWQoc3RydWN0IG1paV9idXMgKmJ1cywgaW50IG1p
aV9pZCwgaW50IHJlZ251bSkNCj4gK3N0YXRpYyBpbnQgZmVjX2VuZXRfbWRpb19yZWFkX2MyMihz
dHJ1Y3QgbWlpX2J1cyAqYnVzLCBpbnQgbWlpX2lkLCBpbnQNCj4gcmVnbnVtKQ0KPiAgew0KPiAg
CXN0cnVjdCBmZWNfZW5ldF9wcml2YXRlICpmZXAgPSBidXMtPnByaXY7DQo+ICAJc3RydWN0IGRl
dmljZSAqZGV2ID0gJmZlcC0+cGRldi0+ZGV2Ow0KPiAgCWludCByZXQgPSAwLCBmcmFtZV9zdGFy
dCwgZnJhbWVfYWRkciwgZnJhbWVfb3A7DQo+IC0JYm9vbCBpc19jNDUgPSAhIShyZWdudW0gJiBN
SUlfQUREUl9DNDUpOw0KPiANCj4gIAlyZXQgPSBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KGRl
dik7DQo+ICAJaWYgKHJldCA8IDApDQo+ICAJCXJldHVybiByZXQ7DQo+IA0KPiAtCWlmIChpc19j
NDUpIHsNCj4gLQkJZnJhbWVfc3RhcnQgPSBGRUNfTU1GUl9TVF9DNDU7DQo+ICsJLyogQzIyIHJl
YWQgKi8NCj4gKwlmcmFtZV9vcCA9IEZFQ19NTUZSX09QX1JFQUQ7DQo+ICsJZnJhbWVfc3RhcnQg
PSBGRUNfTU1GUl9TVDsNCj4gKwlmcmFtZV9hZGRyID0gcmVnbnVtOw0KPiANCj4gLQkJLyogd3Jp
dGUgYWRkcmVzcyAqLw0KPiAtCQlmcmFtZV9hZGRyID0gKHJlZ251bSA+PiAxNik7DQo+IC0JCXdy
aXRlbChmcmFtZV9zdGFydCB8IEZFQ19NTUZSX09QX0FERFJfV1JJVEUgfA0KPiAtCQkgICAgICAg
RkVDX01NRlJfUEEobWlpX2lkKSB8IEZFQ19NTUZSX1JBKGZyYW1lX2FkZHIpIHwNCj4gLQkJICAg
ICAgIEZFQ19NTUZSX1RBIHwgKHJlZ251bSAmIDB4RkZGRiksDQo+IC0JCSAgICAgICBmZXAtPmh3
cCArIEZFQ19NSUlfREFUQSk7DQo+ICsJLyogc3RhcnQgYSByZWFkIG9wICovDQo+ICsJd3JpdGVs
KGZyYW1lX3N0YXJ0IHwgZnJhbWVfb3AgfA0KPiArCSAgICAgICBGRUNfTU1GUl9QQShtaWlfaWQp
IHwgRkVDX01NRlJfUkEoZnJhbWVfYWRkcikgfA0KPiArCSAgICAgICBGRUNfTU1GUl9UQSwgZmVw
LT5od3AgKyBGRUNfTUlJX0RBVEEpOw0KPiANCj4gLQkJLyogd2FpdCBmb3IgZW5kIG9mIHRyYW5z
ZmVyICovDQo+IC0JCXJldCA9IGZlY19lbmV0X21kaW9fd2FpdChmZXApOw0KPiAtCQlpZiAocmV0
KSB7DQo+IC0JCQluZXRkZXZfZXJyKGZlcC0+bmV0ZGV2LCAiTURJTyBhZGRyZXNzIHdyaXRlIHRp
bWVvdXRcbiIpOw0KPiAtCQkJZ290byBvdXQ7DQo+IC0JCX0NCj4gKwkvKiB3YWl0IGZvciBlbmQg
b2YgdHJhbnNmZXIgKi8NCj4gKwlyZXQgPSBmZWNfZW5ldF9tZGlvX3dhaXQoZmVwKTsNCj4gKwlp
ZiAocmV0KSB7DQo+ICsJCW5ldGRldl9lcnIoZmVwLT5uZXRkZXYsICJNRElPIHJlYWQgdGltZW91
dFxuIik7DQo+ICsJCWdvdG8gb3V0Ow0KPiArCX0NCj4gDQo+IC0JCWZyYW1lX29wID0gRkVDX01N
RlJfT1BfUkVBRF9DNDU7DQo+ICsJcmV0ID0gRkVDX01NRlJfREFUQShyZWFkbChmZXAtPmh3cCAr
IEZFQ19NSUlfREFUQSkpOw0KPiANCj4gLQl9IGVsc2Ugew0KPiAtCQkvKiBDMjIgcmVhZCAqLw0K
PiAtCQlmcmFtZV9vcCA9IEZFQ19NTUZSX09QX1JFQUQ7DQo+IC0JCWZyYW1lX3N0YXJ0ID0gRkVD
X01NRlJfU1Q7DQo+IC0JCWZyYW1lX2FkZHIgPSByZWdudW07DQo+ICtvdXQ6DQo+ICsJcG1fcnVu
dGltZV9tYXJrX2xhc3RfYnVzeShkZXYpOw0KPiArCXBtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5k
KGRldik7DQo+ICsNCj4gKwlyZXR1cm4gcmV0Ow0KPiArfQ0KPiArDQo+ICtzdGF0aWMgaW50IGZl
Y19lbmV0X21kaW9fcmVhZF9jNDUoc3RydWN0IG1paV9idXMgKmJ1cywgaW50IG1paV9pZCwNCj4g
KwkJCQkgIGludCBkZXZhZCwgaW50IHJlZ251bSkNCj4gK3sNCj4gKwlzdHJ1Y3QgZmVjX2VuZXRf
cHJpdmF0ZSAqZmVwID0gYnVzLT5wcml2Ow0KPiArCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZmZXAt
PnBkZXYtPmRldjsNCj4gKwlpbnQgcmV0ID0gMCwgZnJhbWVfc3RhcnQsIGZyYW1lX29wOw0KPiAr
DQo+ICsJcmV0ID0gcG1fcnVudGltZV9yZXN1bWVfYW5kX2dldChkZXYpOw0KPiArCWlmIChyZXQg
PCAwKQ0KPiArCQlyZXR1cm4gcmV0Ow0KPiArDQo+ICsJZnJhbWVfc3RhcnQgPSBGRUNfTU1GUl9T
VF9DNDU7DQo+ICsNCj4gKwkvKiB3cml0ZSBhZGRyZXNzICovDQo+ICsJd3JpdGVsKGZyYW1lX3N0
YXJ0IHwgRkVDX01NRlJfT1BfQUREUl9XUklURSB8DQo+ICsJICAgICAgIEZFQ19NTUZSX1BBKG1p
aV9pZCkgfCBGRUNfTU1GUl9SQShkZXZhZCkgfA0KPiArCSAgICAgICBGRUNfTU1GUl9UQSB8IChy
ZWdudW0gJiAweEZGRkYpLA0KPiArCSAgICAgICBmZXAtPmh3cCArIEZFQ19NSUlfREFUQSk7DQo+
ICsNCj4gKwkvKiB3YWl0IGZvciBlbmQgb2YgdHJhbnNmZXIgKi8NCj4gKwlyZXQgPSBmZWNfZW5l
dF9tZGlvX3dhaXQoZmVwKTsNCj4gKwlpZiAocmV0KSB7DQo+ICsJCW5ldGRldl9lcnIoZmVwLT5u
ZXRkZXYsICJNRElPIGFkZHJlc3Mgd3JpdGUgdGltZW91dFxuIik7DQo+ICsJCWdvdG8gb3V0Ow0K
PiAgCX0NCj4gDQo+ICsJZnJhbWVfb3AgPSBGRUNfTU1GUl9PUF9SRUFEX0M0NTsNCj4gKw0KPiAg
CS8qIHN0YXJ0IGEgcmVhZCBvcCAqLw0KPiAgCXdyaXRlbChmcmFtZV9zdGFydCB8IGZyYW1lX29w
IHwNCj4gLQkJRkVDX01NRlJfUEEobWlpX2lkKSB8IEZFQ19NTUZSX1JBKGZyYW1lX2FkZHIpIHwN
Cj4gLQkJRkVDX01NRlJfVEEsIGZlcC0+aHdwICsgRkVDX01JSV9EQVRBKTsNCj4gKwkgICAgICAg
RkVDX01NRlJfUEEobWlpX2lkKSB8IEZFQ19NTUZSX1JBKGRldmFkKSB8DQo+ICsJICAgICAgIEZF
Q19NTUZSX1RBLCBmZXAtPmh3cCArIEZFQ19NSUlfREFUQSk7DQo+IA0KPiAgCS8qIHdhaXQgZm9y
IGVuZCBvZiB0cmFuc2ZlciAqLw0KPiAgCXJldCA9IGZlY19lbmV0X21kaW9fd2FpdChmZXApOw0K
PiBAQCAtMjA0NSw0NSArMjA3Miw2OSBAQCBzdGF0aWMgaW50IGZlY19lbmV0X21kaW9fcmVhZChz
dHJ1Y3QgbWlpX2J1cw0KPiAqYnVzLCBpbnQgbWlpX2lkLCBpbnQgcmVnbnVtKQ0KPiAgCXJldHVy
biByZXQ7DQo+ICB9DQo+IA0KPiAtc3RhdGljIGludCBmZWNfZW5ldF9tZGlvX3dyaXRlKHN0cnVj
dCBtaWlfYnVzICpidXMsIGludCBtaWlfaWQsIGludCByZWdudW0sDQo+IC0JCQkgICB1MTYgdmFs
dWUpDQo+ICtzdGF0aWMgaW50IGZlY19lbmV0X21kaW9fd3JpdGVfYzIyKHN0cnVjdCBtaWlfYnVz
ICpidXMsIGludCBtaWlfaWQsIGludA0KPiByZWdudW0sDQo+ICsJCQkJICAgdTE2IHZhbHVlKQ0K
PiAgew0KPiAgCXN0cnVjdCBmZWNfZW5ldF9wcml2YXRlICpmZXAgPSBidXMtPnByaXY7DQo+ICAJ
c3RydWN0IGRldmljZSAqZGV2ID0gJmZlcC0+cGRldi0+ZGV2Ow0KPiAgCWludCByZXQsIGZyYW1l
X3N0YXJ0LCBmcmFtZV9hZGRyOw0KPiAtCWJvb2wgaXNfYzQ1ID0gISEocmVnbnVtICYgTUlJX0FE
RFJfQzQ1KTsNCj4gDQo+ICAJcmV0ID0gcG1fcnVudGltZV9yZXN1bWVfYW5kX2dldChkZXYpOw0K
PiAgCWlmIChyZXQgPCAwKQ0KPiAgCQlyZXR1cm4gcmV0Ow0KPiANCj4gLQlpZiAoaXNfYzQ1KSB7
DQo+IC0JCWZyYW1lX3N0YXJ0ID0gRkVDX01NRlJfU1RfQzQ1Ow0KPiArCS8qIEMyMiB3cml0ZSAq
Lw0KPiArCWZyYW1lX3N0YXJ0ID0gRkVDX01NRlJfU1Q7DQo+ICsJZnJhbWVfYWRkciA9IHJlZ251
bTsNCj4gDQo+IC0JCS8qIHdyaXRlIGFkZHJlc3MgKi8NCj4gLQkJZnJhbWVfYWRkciA9IChyZWdu
dW0gPj4gMTYpOw0KPiAtCQl3cml0ZWwoZnJhbWVfc3RhcnQgfCBGRUNfTU1GUl9PUF9BRERSX1dS
SVRFIHwNCj4gLQkJICAgICAgIEZFQ19NTUZSX1BBKG1paV9pZCkgfCBGRUNfTU1GUl9SQShmcmFt
ZV9hZGRyKSB8DQo+IC0JCSAgICAgICBGRUNfTU1GUl9UQSB8IChyZWdudW0gJiAweEZGRkYpLA0K
PiAtCQkgICAgICAgZmVwLT5od3AgKyBGRUNfTUlJX0RBVEEpOw0KPiArCS8qIHN0YXJ0IGEgd3Jp
dGUgb3AgKi8NCj4gKwl3cml0ZWwoZnJhbWVfc3RhcnQgfCBGRUNfTU1GUl9PUF9XUklURSB8DQo+
ICsJICAgICAgIEZFQ19NTUZSX1BBKG1paV9pZCkgfCBGRUNfTU1GUl9SQShmcmFtZV9hZGRyKSB8
DQo+ICsJICAgICAgIEZFQ19NTUZSX1RBIHwgRkVDX01NRlJfREFUQSh2YWx1ZSksDQo+ICsJICAg
ICAgIGZlcC0+aHdwICsgRkVDX01JSV9EQVRBKTsNCj4gDQo+IC0JCS8qIHdhaXQgZm9yIGVuZCBv
ZiB0cmFuc2ZlciAqLw0KPiAtCQlyZXQgPSBmZWNfZW5ldF9tZGlvX3dhaXQoZmVwKTsNCj4gLQkJ
aWYgKHJldCkgew0KPiAtCQkJbmV0ZGV2X2VycihmZXAtPm5ldGRldiwgIk1ESU8gYWRkcmVzcyB3
cml0ZSB0aW1lb3V0XG4iKTsNCj4gLQkJCWdvdG8gb3V0Ow0KPiAtCQl9DQo+IC0JfSBlbHNlIHsN
Cj4gLQkJLyogQzIyIHdyaXRlICovDQo+IC0JCWZyYW1lX3N0YXJ0ID0gRkVDX01NRlJfU1Q7DQo+
IC0JCWZyYW1lX2FkZHIgPSByZWdudW07DQo+ICsJLyogd2FpdCBmb3IgZW5kIG9mIHRyYW5zZmVy
ICovDQo+ICsJcmV0ID0gZmVjX2VuZXRfbWRpb193YWl0KGZlcCk7DQo+ICsJaWYgKHJldCkNCj4g
KwkJbmV0ZGV2X2VycihmZXAtPm5ldGRldiwgIk1ESU8gd3JpdGUgdGltZW91dFxuIik7DQo+ICsN
Cj4gKwlwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5KGRldik7DQo+ICsJcG1fcnVudGltZV9wdXRf
YXV0b3N1c3BlbmQoZGV2KTsNCj4gKw0KPiArCXJldHVybiByZXQ7DQo+ICt9DQo+ICsNCj4gK3N0
YXRpYyBpbnQgZmVjX2VuZXRfbWRpb193cml0ZV9jNDUoc3RydWN0IG1paV9idXMgKmJ1cywgaW50
IG1paV9pZCwNCj4gKwkJCQkgICBpbnQgZGV2YWQsIGludCByZWdudW0sIHUxNiB2YWx1ZSkNCj4g
K3sNCj4gKwlzdHJ1Y3QgZmVjX2VuZXRfcHJpdmF0ZSAqZmVwID0gYnVzLT5wcml2Ow0KPiArCXN0
cnVjdCBkZXZpY2UgKmRldiA9ICZmZXAtPnBkZXYtPmRldjsNCj4gKwlpbnQgcmV0LCBmcmFtZV9z
dGFydDsNCj4gKw0KPiArCXJldCA9IHBtX3J1bnRpbWVfcmVzdW1lX2FuZF9nZXQoZGV2KTsNCj4g
KwlpZiAocmV0IDwgMCkNCj4gKwkJcmV0dXJuIHJldDsNCj4gKw0KPiArCWZyYW1lX3N0YXJ0ID0g
RkVDX01NRlJfU1RfQzQ1Ow0KPiArDQo+ICsJLyogd3JpdGUgYWRkcmVzcyAqLw0KPiArCXdyaXRl
bChmcmFtZV9zdGFydCB8IEZFQ19NTUZSX09QX0FERFJfV1JJVEUgfA0KPiArCSAgICAgICBGRUNf
TU1GUl9QQShtaWlfaWQpIHwgRkVDX01NRlJfUkEoZGV2YWQpIHwNCj4gKwkgICAgICAgRkVDX01N
RlJfVEEgfCAocmVnbnVtICYgMHhGRkZGKSwNCj4gKwkgICAgICAgZmVwLT5od3AgKyBGRUNfTUlJ
X0RBVEEpOw0KPiArDQo+ICsJLyogd2FpdCBmb3IgZW5kIG9mIHRyYW5zZmVyICovDQo+ICsJcmV0
ID0gZmVjX2VuZXRfbWRpb193YWl0KGZlcCk7DQo+ICsJaWYgKHJldCkgew0KPiArCQluZXRkZXZf
ZXJyKGZlcC0+bmV0ZGV2LCAiTURJTyBhZGRyZXNzIHdyaXRlIHRpbWVvdXRcbiIpOw0KPiArCQln
b3RvIG91dDsNCj4gIAl9DQo+IA0KPiAgCS8qIHN0YXJ0IGEgd3JpdGUgb3AgKi8NCj4gIAl3cml0
ZWwoZnJhbWVfc3RhcnQgfCBGRUNfTU1GUl9PUF9XUklURSB8DQo+IC0JCUZFQ19NTUZSX1BBKG1p
aV9pZCkgfCBGRUNfTU1GUl9SQShmcmFtZV9hZGRyKSB8DQo+IC0JCUZFQ19NTUZSX1RBIHwgRkVD
X01NRlJfREFUQSh2YWx1ZSksDQo+IC0JCWZlcC0+aHdwICsgRkVDX01JSV9EQVRBKTsNCj4gKwkg
ICAgICAgRkVDX01NRlJfUEEobWlpX2lkKSB8IEZFQ19NTUZSX1JBKGRldmFkKSB8DQo+ICsJICAg
ICAgIEZFQ19NTUZSX1RBIHwgRkVDX01NRlJfREFUQSh2YWx1ZSksDQo+ICsJICAgICAgIGZlcC0+
aHdwICsgRkVDX01JSV9EQVRBKTsNCj4gDQo+ICAJLyogd2FpdCBmb3IgZW5kIG9mIHRyYW5zZmVy
ICovDQo+ICAJcmV0ID0gZmVjX2VuZXRfbWRpb193YWl0KGZlcCk7DQo+IEBAIC0yMzgxLDggKzI0
MzIsMTAgQEAgc3RhdGljIGludCBmZWNfZW5ldF9taWlfaW5pdChzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlDQo+ICpwZGV2KQ0KPiAgCX0NCj4gDQo+ICAJZmVwLT5taWlfYnVzLT5uYW1lID0gImZlY19l
bmV0X21paV9idXMiOw0KPiAtCWZlcC0+bWlpX2J1cy0+cmVhZCA9IGZlY19lbmV0X21kaW9fcmVh
ZDsNCj4gLQlmZXAtPm1paV9idXMtPndyaXRlID0gZmVjX2VuZXRfbWRpb193cml0ZTsNCj4gKwlm
ZXAtPm1paV9idXMtPnJlYWQgPSBmZWNfZW5ldF9tZGlvX3JlYWRfYzIyOw0KPiArCWZlcC0+bWlp
X2J1cy0+d3JpdGUgPSBmZWNfZW5ldF9tZGlvX3dyaXRlX2MyMjsNCj4gKwlmZXAtPm1paV9idXMt
PnJlYWRfYzQ1ID0gZmVjX2VuZXRfbWRpb19yZWFkX2M0NTsNCj4gKwlmZXAtPm1paV9idXMtPndy
aXRlX2M0NSA9IGZlY19lbmV0X21kaW9fd3JpdGVfYzQ1Ow0KPiAgCXNucHJpbnRmKGZlcC0+bWlp
X2J1cy0+aWQsIE1JSV9CVVNfSURfU0laRSwgIiVzLSV4IiwNCj4gIAkJcGRldi0+bmFtZSwgZmVw
LT5kZXZfaWQgKyAxKTsNCj4gIAlmZXAtPm1paV9idXMtPnByaXYgPSBmZXA7DQo+IA0KDQpJdCBs
b29rcyBnb29kIHRvIG1lLg0KUmV2aWV3ZWQtYnk6IFdlaSBGYW5nIDx3ZWkuZmFuZ0BueHAuY29t
Pg0KDQo=
