Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0424A5FFB29
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Oct 2022 18:03:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbiJOQDJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 15 Oct 2022 12:03:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229684AbiJOQDH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 15 Oct 2022 12:03:07 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2107.outbound.protection.outlook.com [40.107.114.107])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49CCA4C2E3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 15 Oct 2022 09:03:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BvDs/F5Daa4qDuSgkApxw1VG5vuAEdaZSYAv3ppQoVYeBSztPEfqMdMUn9mXSU89M/IIkddpzW4Kcy/ZMBV17xT14NF+I7y3dTECqCL1MtjwkTCt63+YdItSyOsDAeE0tJJ1Ml252IHIsKVokA6Qqm2cUPhq7P4bfewAESz5L6p7xJ8P/nWjwzm7YjUMAVCl2tzfubffcIcM5LiJKT7CTOn0UqfR544s4W1DNKKarwqaMIViid8rfJpVEIXIikSxOc4GqmIfjfKibIujNfUdfQqVy72lu5M+VVG5HNJm/1o1iD76yDWEY4zYBMAYDjZYFEjT7X9THnd8tsM1/wkGEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5d59MvhGskkbH+ef6lXlhOv7zFEqfJAj8wsGdX4sqOg=;
 b=XzlEncHjm+Iy3ONAleoCRzBR51aqIZjfy2lRcgY4INh04zgc633wxQuINwVuRrawbIMG/RYx77uAT8vOmAQsZZ5kJtaMRNyST7DpJ6eMjOGr2aSa+0T3TH+mbKRe4tS9SRzSPoIPmdpr68cN7GRsA5i0arkuUUC8vrGelcGEYZ+C8GLUr0KOz48Gl3YvXMqYD1NjXn6KTs1oMlmPLWVAFAsqMwM9jXmC3S6Fb5V0SS33WM0E8i02qPPATjqh/tYCFLPkphV83RWSoy1CFuNezhIpqeTKrj7bZ6j9yZaJDnpevtBERwKbHhWZSqnzglS+f3QO1Jdn496adVqmcR+Iag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5d59MvhGskkbH+ef6lXlhOv7zFEqfJAj8wsGdX4sqOg=;
 b=TO1W7JP4vrYOoeGw8ph5NCc/v7yhH8feQ8fEomaDLxE91IvmoFhryEXNHyhAWo1R1vZUOxxSw1m76UD7kf4Z9WLGjxxrwdj4S2bYafotueFcyWEo2vUlj3k+3XcO1nfsu8hcfghAFXqhABEIosC/QmpP1woxEfEh8iOffmCWyVQ=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYYPR01MB10530.jpnprd01.prod.outlook.com (2603:1096:400:30d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Sat, 15 Oct
 2022 16:03:02 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::73a6:588d:1198:7262]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::73a6:588d:1198:7262%8]) with mapi id 15.20.5723.030; Sat, 15 Oct 2022
 16:03:02 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v8 0/3] Add RZ/G2L DSI driver
Thread-Topic: [PATCH v8 0/3] Add RZ/G2L DSI driver
Thread-Index: AQHYzN90vuwfyOFCtEyXvr9R15v3X64PlUVggAAvxwCAAAA/AA==
Date:   Sat, 15 Oct 2022 16:03:02 +0000
Message-ID: <OS0PR01MB59229AF5DC6934096778E3FA86279@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220920105501.396999-1-biju.das.jz@bp.renesas.com>
 <OS0PR01MB592238A6FBE0BA8368EEE57C86279@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <Y0rZXpcW2U747bg5@pendragon.ideasonboard.com>
In-Reply-To: <Y0rZXpcW2U747bg5@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYYPR01MB10530:EE_
x-ms-office365-filtering-correlation-id: 706a32bc-1065-4617-5f5d-08daaec6bd41
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7dq71BvE6+ot/Iql2/JHzxNPDQzo+0WwYTZWpvvb3gXZp0sKnaLx531VVirtHj7+bSiL3mXQ6KkKRGYd/TIGE2O9qq6QQOwmyvMidO3NYWuOCWGdXxoL1btAYDPmG4aXCjQWTUtAgFfId69HRFN1pztZNur60JCfaLripEHJNLSI9LrSnld661zPFMlaZUQ5q4D/jSjvErMBiA9/zV43D/5EoZJ8xT0SMJ3yo1HNx1yZBiiOwDn2lRJAq+z0YjEFbFnx98OwfsnLvE9btOVBu60qzf4pzcGkFb/cru8qx3GvxEjWKjrxj3fWS27t76gDhULMaXgwhdd2PGwoMk8nMXRrrkjDi8mFVIvU9mrFJgFshpkbj3cjL9rVUnGBbN1/WlHhX5H3R9tDUel22sqaf3UArj5vylT0wM5+9KeHzlWEJmL2eXLI69Eb5aGCpmj0xNq3bJaITjt4P1mdyU5l4n5tyZkGyyV4KfQf9xGhQ9LBobJdcoXgMMj7VWjLUGRph0DGv6D/G9OHAatCsczgO7kmNc+/To28xsGpt3dwG3L63994dQbEzuHdHJD1Zt5840+bwQ5uZhLKG5Dt3Mbq2Fa+R4I8wrpk2aqUgeieFBaGBObt3IKvCqzQB/C3twGIVczIV2ni9NGjQwK8nAB2X7MwW20Tth2guSlbAcKoM4nzRp4YtP88Hax/qPuoWqiR1wVRamnPVdNkRu5q/Bz7J8wwK4PocwALTe1MU9rOyDpI3rmXZ9qdrwZnzgi+/RvYCNlcZyi3p2VwGTTbbK81tw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(39860400002)(376002)(396003)(346002)(451199015)(38070700005)(55016003)(33656002)(86362001)(122000001)(38100700002)(83380400001)(316002)(107886003)(478600001)(71200400001)(6916009)(54906003)(7696005)(41300700001)(2906002)(5660300002)(6506007)(186003)(26005)(52536014)(9686003)(8936002)(4326008)(8676002)(64756008)(66946007)(76116006)(66476007)(66446008)(66556008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YjByVXpDS0txc2h5TGhjeUxTUGkyVTBHa05jVElxRzk4VFY3NTY5ZHdjUHpx?=
 =?utf-8?B?SkhxL0VDQm5PaEtRZjhiVDcvTFF2TXAzUm9ld1d3Y29zWDdzSm9JejVNWVl5?=
 =?utf-8?B?eXZ2b3IvaGJlblJ5QkJwUmJ3REVvUjhZU1V1RnBUWGFodktGK3ZPa2g1eEZG?=
 =?utf-8?B?Q2VRYldpNkFFTlNHNnV2enZhVzhOUExRVXV1UXlzNG15TEpxeUttNmw3Vmta?=
 =?utf-8?B?RmVCNHJ1ZUZtV0lZZnVsMDlvR0ZYZmxYNXNDakJOUmZmOE1xZU1YWXF5dXFp?=
 =?utf-8?B?V202RmhKNFgwZEFqT2xacXd0ZlA0aktTaVhvYXpJV2JWRHk4NlpRNFVjS0pr?=
 =?utf-8?B?d2ZnWm82Q2x5SHBsVGJaN2U2VTg4NHl4MXhCK0o5Q1V0UEhrRGdnczNYZVB2?=
 =?utf-8?B?ZlkxMFhleVpxaXVZZmZ3cWFwbXd4UTFrMTFma3F4WHE5cGZCU3BlSHUzcEU3?=
 =?utf-8?B?M2VxWFRmSnB2bXRnMXFabnpUcm9sQkgyWUl6L29MdHhCdzhSVnZWYjNzOHlU?=
 =?utf-8?B?aFhHYldHbmVBbEVqTFF6K3pEZUFUZzZzN2FzK01BRXhlTExXQ2lYT296ZjFQ?=
 =?utf-8?B?Wms1elNjaTB3N0pFelBGa3BBdHlGbjNxWTJkWDZ1OE5VaGpZdlhRZkVWQ2ls?=
 =?utf-8?B?ZEhEUDVMVEI5SHpJSGxqYWs5MDVJTFowaE12ZHhTeG5HOXZLS2llZUVjSTFC?=
 =?utf-8?B?SzBNcXA1SE9CZ1VlSDVzZGpGdmtSSkQ4VmpsdENvckxjZHdJcmNmZ05TQ0hC?=
 =?utf-8?B?UUtzRFQ2RE1Wdithd2pPU0VkNGRjenJpdTZraG1mc1hTR1ZaYnkybWFJTitM?=
 =?utf-8?B?aXo3T1g3VU5kOU56NjRWN0RWSU1qazVBZXg0RGtsRXUxSy9QcW5QRFIzbjd4?=
 =?utf-8?B?RWNOSGV6LzlJQ0xoVjdvNGF0bEhybXFnbG0wZmtwbHJpbkxtOUdJcFlKRFFl?=
 =?utf-8?B?R2dwUVQyV3VQSWVSWStJMnVSYlFYNmZUclVXOS9hSE94Tm1MeHlEVHBZdWNy?=
 =?utf-8?B?cHdYT0JuK2I4aGM4MlYwbWVoZjVIWWJKZlJ0WDdOblVmWHo0emJONFE2TC9o?=
 =?utf-8?B?Vk51T3dRWDEyb01VL3BuYmNWZEk3WUkxRGlpM0U3NjlKT2UxVFVtaVYyYnlR?=
 =?utf-8?B?SGpWWlg3M2ppTzBXUXBLWm5FUVhDK2I4Mk85RjdVRkE5Sld2L0k1dGpCS3Ix?=
 =?utf-8?B?bllWS3Z4OEdYbGNNQWJManJ6NCt0VHRrUnc1MTFGWHhIOWNjRWJyTmpzeTU2?=
 =?utf-8?B?QlBxcFl0UmZPa0M0Skc5b09BL243TktmWnhnWkhlUzNIWlh5TzNzV3RqOUJx?=
 =?utf-8?B?ekRwZEVKMlZ2ME1Lb1V1R0JMZS96WDF3UXZOdTdnZFlaQklKdmRzczUzanky?=
 =?utf-8?B?Y1pYRURvMSt0Vms2U05ja3plOExMUG92TlpKUy9IeVFSZGc0cEQwUHZXSElT?=
 =?utf-8?B?T2lUMHlUMEdVRTdqMGZKemJZeWVVQjJ5c2J2NGpwcGcwRllQT0F0b1RwcG0x?=
 =?utf-8?B?elpSSGxkK09zamhVRWJWRzI2dHo2M2JOa3haajNzMUNyUytrdG5NYURxeGpK?=
 =?utf-8?B?RUpVT3FqNUZSRnVPamdYSytrdTB1alMwVFBoMjNTVzRBM1Z4MW5jZklqMmN1?=
 =?utf-8?B?TGRlNlZScVpqUmhuVXg3OHBFai9wS1VPOTRFN09pZFFaREtCV1FpTmx6VGo5?=
 =?utf-8?B?M2RrR1NaNlZjZi9qeHB2dVM2ZG9HQk5LS1MvZGtmNjIwY3FpM2JVb3lrLytz?=
 =?utf-8?B?dkowT1VoeEpDYnVWS2pFbktQOUNOTXQ5VWk1Uk9sZmgrVXFjTzRBdERvT0lU?=
 =?utf-8?B?c2RGL056RzhQNy9Lc28yYndaaWVPU0pLOXZhR2M1L1RqYkV6a2ZhNG5mbEJK?=
 =?utf-8?B?cXhKVlFiVnRSZEJDMHQvSW9BZWtEUEZjUFM4am1tTnhFdXV1WEQ3NTlnTjU2?=
 =?utf-8?B?U1B5NnZ4RWkrTzBseGU3MHRvVmRHMmhpMnF5OHZYNGtkclBhREJ4UEROU0lj?=
 =?utf-8?B?MXlDV3orUGl1RXZWbzUrOHBpVER2dHJZbVFZOG96YjRDb1M3RWlPRHdUa1Q3?=
 =?utf-8?B?TC9yMVhyMmNIRmM0Q2s5bTNaZVJZa3d2aTVrTnZHaTRvcERNd2toVkU0UkVD?=
 =?utf-8?Q?jDRCYkQtx4NC9r1tJJ8CCaWC3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 706a32bc-1065-4617-5f5d-08daaec6bd41
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2022 16:03:02.8125
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n1yHtJBgkgfrLL5Bm1ypuT4rCgZfuvXgPCdCf5v6ecHfAs2jNZLzU4TZHG/ramOVH6iYvUXMxbS+m9swLFwhe0Y2ngFLeVR93K7Z6hTXbsk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB10530
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgTGF1cmVudCwNCg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY4IDAvM10gQWRkIFJaL0cyTCBE
U0kgZHJpdmVyDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gU2F0LCBPY3QgMTUsIDIwMjIgYXQg
MDE6MTE6MjBQTSArMDAwMCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gR2VudGxlIHBpbmcuDQo+IA0K
PiBJJ3ZlIHJldmlld2VkIHY4LCBldmVyeXRoaW5nIGxvb2tzIGZpbmUuIEkndmUgYXBwbGllZCB0
aGUgcGF0Y2hlcyB0bw0KPiBteSB0cmVlIChbMV0pIGZvciB2Ni4yLg0KDQpUaGFua3MsDQpCaWp1
DQoNCj4gDQo+IFsxXSBnaXQ6Ly9saW51eHR2Lm9yZy9waW5jaGFydGwvbWVkaWEuZ2l0IGRybS9k
dS9uZXh0DQo+IA0KPiA+ID4gU3ViamVjdDogW1BBVENIIHY4IDAvM10gQWRkIFJaL0cyTCBEU0kg
ZHJpdmVyDQo+ID4gPg0KPiA+ID4gVGhpcyBwYXRjaCBzZXJpZXMgYWltcyB0byBzdXBwb3J0IHRo
ZSBNSVBJIERTSSBlbmNvZGVyIGZvdW5kIGluDQo+IHRoZQ0KPiA+ID4gUlovRzJMIFNvQy4gSXQg
Y3VycmVudGx5IHN1cHBvcnRzIERTSSB2aWRlbyBtb2RlIG9ubHkuDQo+ID4gPg0KPiA+ID4gVGhp
cyB1bml0IHN1cHBvcnRzIE1JUEkgQWxsaWFuY2UgU3BlY2lmaWNhdGlvbiBmb3IgRGlzcGxheSBT
ZXJpYWwNCj4gPiA+IEludGVyZmFjZSAoRFNJKSBTcGVjaWZpY2F0aW9uLiBUaGlzIHVuaXQgcHJv
dmlkZXMgYSBzb2x1dGlvbiBmb3INCj4gPiA+IHRyYW5zbWl0dGluZyBNSVBJIERTSSBjb21wbGlh
bnQgZGlnaXRhbCB2aWRlbyBhbmQgcGFja2V0cy4NCj4gTm9ybWF0aXZlDQo+ID4gPiBSZWZlcmVu
Y2VzIGFyZSBiZWxvdy4NCj4gPiA+ICogTUlQSSBBbGxpYW5jZSBTcGVjaWZpY2F0aW9uIGZvciBE
aXNwbGF5IFNlcmlhbCBJbnRlcmZhY2UgVmVyc2lvbg0KPiA+ID4gMS4zLjENCj4gPiA+ICogTUlQ
SSBBbGxpYW5jZSBTcGVjaWZpY2F0aW9uIGZvciBELVBIWSBWZXJzaW9uIDIuMQ0KPiA+ID4NCj4g
PiA+IFRoZSBmb2xsb3dpbmcgYXJlIGtleSBmZWF0dXJlcyBvZiB0aGlzIHVuaXQuDQo+ID4gPg0K
PiA+ID4gKiAxIGNoYW5uZWwNCj4gPiA+ICogVGhlIG51bWJlciBvZiBMYW5lOiA0LWxhbmUNCj4g
PiA+ICogU3VwcG9ydCB1cCB0byBGdWxsIEhEICgxOTIwIMOXIDEwODApLCA2MCBmcHMgKFJHQjg4
OCkNCj4gPiA+ICogTWF4aW11bSBCYW5kd2lkdGg6IDEuNSBHYnBzIHBlciBsYW5lDQo+ID4gPiAq
IFN1cHBvcnQgT3V0cHV0IERhdGEgRm9ybWF0OiBSR0I2NjYgLyBSR0I4ODgNCj4gPiA+DQo+ID4g
PiBUaGlzIHBhdGNoIHNlcmllcyBpcyBiYXNlZCBvbiBkcm1fbWlzYyBhbmQgcGF0Y2hlcyBmcm9t
DQo+IGRybS9kdS9uZXh0DQo+ID4gPiBbMV0NCj4gPiA+DQo+ID4gPg0KPiA+ID4gdjctPnY4Og0K
PiA+ID4gICogQWRkZWQgUmIgdGFnIGZyb20gTGF1cmVudC4NCj4gPiA+ICAqIEFkZGVkIGhzZnJl
cV9tYXggdG8gc3RydWN0IHJ6ZzJsX21pcGlfZHNpX3RpbWluZ3MuDQo+ID4gPiAgKiBSZW1vdmVk
IGVudW1zIHJ6ZzJsX21pcGlfZHNpX2RwaHlfdGltaW5ncy4NCj4gPiA+ICAqIFJlcGxhY2VkIGlm
IGVsc2Ugd2l0aCBmb3IgbG9vcCBmb3IgZmluZGluZyBkcGh5X3RpbWluZ3MNCj4gPiA+ICAgIGJh
c2VkIG9uIGhzZnJlcS4NCj4gPiA+ICAqIFJlbW92ZWQgY2hlY2tpbmcgIm51bWJlciBvZiBsYW5l
cyBjYXBhYmlsaXR5IiBmcm9tDQo+IHJ6ZzJsX21pcGlfZHNpXw0KPiA+ID4gICAgc3RhcnR1cCgp
IGFuZCBhZGRlZCBwYXRjaCMzIGZvciBoYW5kbGluZyBpdCBpbiBwcm9iZSgpIGFuZA0KPiBlbmZv
cmNpbmcNCj4gPiA+ICAgIGl0IGluIHJ6ZzJsX21pcGlfZHNpX2hvc3RfYXR0YWNoKCkuDQo+ID4g
PiAgKiBBZGRlZCBMYWJlbHMgd2l0aCBhbiAiZXJyXyIgcHJlZml4Lg0KPiA+ID4gCW91dF9wbV9w
dXQtPmVycl9wbV9wdXQNCj4gPiA+IAlvdXRfYXNzZXJ0X3JzdF9hbmRfc3RvcF9jbG9ja3MtPmVy
cl9zdG9wDQo+ID4gPiAJb3V0X3N0b3BfaHNfY2xvY2stPmVycl9zdG9wX2Nsb2NrDQo+ID4gPiAJ
b3V0X3BtX2Rpc2FibGUtPmVycl9wbV9kaXNhYmxlDQo+ID4gPiAgKiBBZGRlZCBlcnJvciBtZXNz
YWdlIGZvciBsYW5lIGNoZWNrIGluDQo+ID4gPiByemcybF9taXBpX2RzaV9ob3N0X2F0dGFjaCgp
DQo+ID4gPiAgKiBSZXBsYWNlZCBkZXZfd2Fybi0+ZGV2X2VyciBmb3IgdGhlIGZvcm1hdCBlcnJv
ciBpbg0KPiByemcybF9taXBpX2RzaV9ob3N0DQo+ID4gPiAgICBfYXR0YWNoKCkuIEFkZGVkIG1p
c3NpbmcgIlxuIiBhbmQgcHJpbnQgdGhlIGZvcm1hdCBmb3INCj4gZGVidWdnaW5nLg0KPiA+ID4g
djYtPnY3Og0KPiA+ID4gICogQWRkZWQgcnpnMmxfbWlwaV9kc2lfc3RvcCgpIGNvdW50ZXJwYXJ0
IG9mDQo+IHJ6ZzJsX21pcGlfZHNpX3N0YXJ0dXAoKS4NCj4gPiA+ICAqIEVycm9yIGxhYmVscyBh
cmUgbmFtZWQgYWNjb3JkaW5nIHRvIHRoZSBjbGVhbnVwIG9wZXJhdGlvbiB0aGV5DQo+IHBlcmZv
cm0uDQo+ID4gPiAgKiBSZXN0b3JlZCBNYXggbGFuZSBjYXBhYmlsaXR5IHJlYWQgYWZ0ZXIgZHBo
eSB0aW1pbmcNCj4gaW5pdGlhbGl6YXRpb24NCj4gPiA+ICAgIGFzIHBlciB0aGUgZ3VpZGUgbGlu
ZXMgZnJvbSBTb0MgZGVzaWduIHRlYW0uDQo+ID4gPiAgKiBBZGRlZCByZWNvbW1lbmRlZCBsdXQg
dmFsdWVzIGZvciB0aGUgR2xvYmFsIE9wZXJhdGlvbiBUaW1pbmcNCj4gPiA+ICAgIHBhcmFtZXRl
cnMgZm9yIE1JUEkgRFBIWS4NCj4gPiA+IHY1LT52NjoNCj4gPiA+ICAqIFVwZGF0ZWQgY29tbWl0
IGRlc2NyaXB0aW9uDQo+ID4gPiAgKiBNb3ZlZCBoYW5kbGluZyBvZiBhcnN0IGFuZCBwcnN0IGZy
b20gcnpnMmxfbWlwaV9kc2lfc3RhcnR1cC0NCj4gPnJ1bnRpbWUNCj4gPiA+ICAgIFBNIHN1c3Bl
bmQvcmVzdW1lIGhhbmRsZXJzLg0KPiA+ID4gICogTWF4IGxhbmUgY2FwYWJpbGl0eSByZWFkIGF0
IHByb2JlKCksIGFuZCBlbmZvcmNlZCBpbg0KPiA+ID4gICAgcnpnMmxfbWlwaV9kc2lfaG9zdF9h
dHRhY2goKQ0KPiA+ID4gICogU2ltcGxpZmllZCB2aWNoMXBwc2V0ciBzZXR0aW5nLg0KPiA+ID4g
ICogUmVuYW1lZCBoc2Nsa19ydW5uaW5nX21vZGUsaHNjbGtfbW9kZS0+aXNfY2xrX2NvbnQuDQo+
ID4gPiAgKiBGaXhlZCB0eXBvIGluIHByb2JlIGVycm9yIG1lc3NhZ2UoYXJzdC0+cnN0KS4NCj4g
PiA+ICAqIFJlb3JkZXJlZCBEUk0gYnJpZGdlIGluaXRhaXphdGlvbiBpbiBwcm9iZSgpDQo+ID4g
PiAgKiBVcGRhdGVkIHR5cG8gaW4gZS1tYWlsIGFkZHJlc3MuDQo+ID4gPiB2NC0+djU6DQo+ID4g
PiAgKiBBZGRlZCBBY2sgZnJvbSBTYW0uDQo+ID4gPiAgKiBBZGRlZCBhIHRyaXZpYWwgY2hhbmdl
LCByZXBsYWNlZCByemcybF9taXBpX2RzaV9wYXJzZV9kdCgpDQo+ID4gPiAgICB3aXRoIGRybV9v
Zl9nZXRfZGF0YV9sYW5lc19jb3VudF9lcCgpIGluIHByb2JlLg0KPiA+ID4gdjMtPnY0Og0KPiA+
ID4gICogVXBkYXRlZCBlcnJvciBoYW5kbGluZyBpbiByemcybF9taXBpX2RzaV9zdGFydHVwKCkg
YW5kDQo+IHJ6ZzJsX21pcGlfZHNpX2F0b21pY19lbmFibGUoKS4NCj4gPiA+IHYyLT52MzoNCj4g
PiA+ICAqIEFkZGVkIFJiIHRhZyBmcm9tIEdlZXJ0IGFuZCBMYXVyZW50DQo+ID4gPiAgKiBGaXhl
ZCB0aGUgdHlwbyAiUmVjZWl2ZSIgLT4gInRyYW5zbWl0Ig0KPiA+ID4gICogQWRkZWQgYWNjZXBp
YmxlIHZhbHVlcyBmb3IgZGF0YS1sYW5lcw0KPiA+ID4gICogU29ydGVkIEhlYWRlciBmaWxlIGlu
IHRoZSBleGFtcGxlDQo+ID4gPiAgKiBBZGRlZCBTb0Mgc3BlY2lmaWMgY29tcGFpYmxlIGFsb25n
IHdpdGggZ2VuZXJpYyBvbmUuDQo+ID4gPiAgKiBwYXNzIHJ6ZzJsX21pcGlfZHNpIHBvaW50ZXIg
dG8ge0xpbmssUGh5fSByZWdpc3RlciByZC93cg0KPiBmdW5jdGlvbiBpbnN0ZWFkDQo+ID4gPiAg
ICBvZiB0aGUgbWVtb3J5IHBvaW50ZXINCj4gPiA+ICAqIEZpeGVkIHRoZSBjb21tZW50IGluIHJ6
ZzJsX21pcGlfZHNpX3N0YXJ0dXAoKQ0KPiA+ID4gICogUmVtb3ZlZCB1bm5lY2Vzc2FyeSBkYmcg
bWVzc2FnZSBmcm9tDQo+IHJ6ZzJsX21pcGlfZHNpX3N0YXJ0X3ZpZGVvKCkNCj4gPiA+ICAqIERS
TSBicmlkZ2UgcGFyYW1ldGVyIGluaXRpYWxpemF0aW9uIG1vdmVkIHRvIHByb2JlDQo+ID4gPiAg
KiBSZXBsYWNlZCBkZXZfZGJnLT5kZXZfZXJyIGluIHJ6ZzJsX21pcGlfZHNpX3BhcnNlX2R0KCkN
Cj4gPiA+ICAqIEluc2VydGVkIHRoZSBtaXNzaW5nIGJsYW5rIGxhbmUgYWZ0ZXIgcmV0dXJuIGlu
IHByb2JlKCkNCj4gPiA+ICAqIEFkZGVkIG1pc3NpbmcgTU9EVUxFX0RFVklDRV9UQUJMRQ0KPiA+
ID4gICogQWRkZWQgaW5jbHVkZSBsaW51eC9iaXRzLmggaW4gaGVhZGVyIGZpbGUNCj4gPiA+ICAq
IEZpeGVkIHZhcmlvdXMgbWFjcm9zIGluIGhlYWRlciBmaWxlLg0KPiA+ID4gICogUmVvcmRlciB0
aGUgbWFrZSBmaWxlIGZvciBEU0ksIHNvIHRoYXQgaXQgaXMgbm8gbW9yZSBkZXBlbmRlbnQNCj4g
PiA+ICAgIG9uIFJaL0cyTCBEVSBwYXRjaCBzZXJpZXMuDQo+ID4gPiB2MS0+djI6DQo+ID4gPiAg
KiBBZGRlZCBmdWxsIHBhdGggZm9yIGRzaS1jb250cm9sbGVyLnlhbWwNCj4gPiA+ICAqIE1vZGVs
ZWQgRFNJICsgRC1QSFkgYXMgc2luZ2xlIGJsb2NrIGFuZCB1cGRhdGVkIHJlZyBwcm9wZXJ0eQ0K
PiA+ID4gICogRml4ZWQgdHlwbyBEX1BIWS0+RC1QSFkNCj4gPiA+ICAqIFVwZGF0ZWQgZGVzY3Jp
cHRpb24NCj4gPiA+ICAqIEFkZGVkIGludGVycnVwdHMgYW5kIGludGVycnVwdC1uYW1lcyBhbmQg
dXBkYXRlZCB0aGUgZXhhbXBsZQ0KPiA+ID4gICogRHJpdmVyIHJld29yayBiYXNlZCBvbiBkdC1i
aW5kaW5nIGNoYW5nZXMgKERTSSArIEQtUEhZKSBhcw0KPiBzaW5nbGUNCj4gPiA+IGJsb2NrDQo+
ID4gPiAgKiBSZXBsYWNlZCBsaW5rX21taW8gYW5kIHBoeV9tbWlvIHdpdGggbW1pbyBpbiBzdHJ1
Y3QNCj4gPiA+IHJ6ZzJsX21pcGlfZHNpDQo+ID4gPiAgKiBSZXBsYWNlZCByemcybF9taXBpX3Bo
eV93cml0ZSB3aXRoIHJ6ZzJsX21pcGlfZHNpX3BoeV93cml0ZQ0KPiA+ID4gICAgYW5kIHJ6ZzJs
X21pcGlfZHNpX2xpbmtfd3JpdGUNCj4gPiA+ICAqIFJlcGxhY2VkIHJ6ZzJsX21pcGlfcGh5X3Jl
YWQtPnJ6ZzJsX21pcGlfZHNpX2xpbmtfcmVhZA0KPiA+ID4gUkZDLT52MToNCj4gPiA+ICAqIEFk
ZGVkIGEgcmVmIHRvIGRzaS1jb250cm9sbGVyLnlhbWwuDQo+ID4gPiAgKiBBZGRlZCAiZGVwZW5k
cyBvbiBBUkNIX1JFTkVTQVMgfHwgQ09NUElMRV9URVNUIiBvbiBLQ09ORklHDQo+ID4gPiAgICBh
bmQgZHJvcHBlZCBEUk0gYXMgaXQgaXMgaW1wbGllZCBieSBEUk1fQlJJREdFDQo+ID4gPiAgKiBV
c2VkIGRldm1fcmVzZXRfY29udHJvbF9nZXRfZXhjbHVzaXZlKCkgZm9yIHJlc2V0IGhhbmRsZQ0K
PiA+ID4gICogUmVtb3ZlZCBib29sIGhzY2xrbW9kZSBmcm9tIHN0cnVjdCByemcybF9taXBpX2Rz
aQ0KPiA+ID4gICogQWRkZWQgZXJyb3IgY2hlY2sgZm9yIHBtLCB1c2luZyBwbV9ydW50aW1lX3Jl
c3VtZV9hbmRfZ2V0KCkNCj4gaW5zdGVhZCBvZg0KPiA+ID4gICAgcG1fcnVudGltZV9nZXRfc3lu
YygpDQo+ID4gPiAgKiBBZGRlZCBjaGVjayBmb3IgdW5zdXBwb3J0ZWQgZm9ybWF0cyBpbg0KPiA+
ID4gcnpnMmxfbWlwaV9kc2lfaG9zdF9hdHRhY2goKQ0KPiA+ID4gICogQXZvaWRlZCByZWFkLW1v
ZGlmeS13cml0ZSBzdG9wcGluZyBoc2Nsb2NrDQo+ID4gPiAgKiBVc2VkIGRldm1fcGxhdGZvcm1f
aW9yZW1hcF9yZXNvdXJjZSBmb3IgcmVzb3VyY2UgYWxsb2NhdGlvbg0KPiA+ID4gICogUmVtb3Zl
ZCB1bm5lY2Vzc2FyeSBhc3NlcnQgY2FsbCBmcm9tIHByb2JlIGFuZCByZW1vdmUuDQo+ID4gPiAg
KiB3cmFwIHRoZSBsaW5lIGFmdGVyIHRoZSBQVFJfRVJSKCkgaW4gcHJvYmUoKQ0KPiA+ID4gICog
VXBkYXRlZCByZXNldCBmYWlsdXJlIG1lc3NhZ2VzIGluIHByb2JlDQo+ID4gPiAgKiBGaXhlZCB0
aGUgdHlwbyBhcnN0Yy0+cHJzdGMNCj4gPiA+ICAqIE1hZGUgaGV4IGNvbnN0YW50cyB0byBsb3dl
ciBjYXNlLg0KPiA+ID4gUkZDOg0KPiA+ID4gICoNCj4gPiA+DQo+ID4gPg0KPiA+ID4gQmlqdSBE
YXMgKDMpOg0KPiA+ID4gICBkdC1iaW5kaW5nczogZGlzcGxheTogYnJpZGdlOiBEb2N1bWVudCBS
Wi9HMkwgTUlQSSBEU0kgVFgNCj4gYmluZGluZ3MNCj4gPiA+ICAgZHJtOiByY2FyLWR1OiBBZGQg
UlovRzJMIERTSSBkcml2ZXINCj4gPiA+ICAgZHJtOiByY2FyLWR1OiByemcybF9taXBpX2RzaTog
RW5oYW5jZSBkZXZpY2UgbGFuZXMgY2hlY2sNCj4gPiA+DQo+ID4gPiAgLi4uL2JpbmRpbmdzL2Rp
c3BsYXkvYnJpZGdlL3JlbmVzYXMsZHNpLnlhbWwgIHwgMTgyICsrKysNCj4gPiA+ICBkcml2ZXJz
L2dwdS9kcm0vcmNhci1kdS9LY29uZmlnICAgICAgICAgICAgICAgfCAgIDggKw0KPiA+ID4gIGRy
aXZlcnMvZ3B1L2RybS9yY2FyLWR1L01ha2VmaWxlICAgICAgICAgICAgICB8ICAgMiArDQo+ID4g
PiAgZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcnpnMmxfbWlwaV9kc2kuYyAgICAgIHwgODE2DQo+
ICsrKysrKysrKysrKysrKysrKw0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3J6ZzJs
X21pcGlfZHNpX3JlZ3MuaCB8IDE1MSArKysrDQo+ID4gPiAgNSBmaWxlcyBjaGFuZ2VkLCAxMTU5
IGluc2VydGlvbnMoKykgIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+ID4gRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3JlbmVzYXMsZHNpLnlhbWwNCj4gPiA+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcnpnMmxfbWlwaV9k
c2kuYw0KPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9y
emcybF9taXBpX2RzaV9yZWdzLmgNCj4gDQo+IC0tDQo+IFJlZ2FyZHMsDQo+IA0KPiBMYXVyZW50
IFBpbmNoYXJ0DQo=
