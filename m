Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BEF07CECE0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Oct 2023 02:40:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbjJSAkZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Oct 2023 20:40:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229726AbjJSAkY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Oct 2023 20:40:24 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2116.outbound.protection.outlook.com [40.107.113.116])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85F6411D;
        Wed, 18 Oct 2023 17:40:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JusCGTkGrJPgggazCykN2QpPsPyJhY7LyOw0pG1nZrPzD9bs1gpN5cTYYNnylbKbBwfM+ZFDIfHS3Tn73g0GgdGveZBJQlhgx7FoDVXLZKzRqoDT+qxQnoqRLzYWkDSJEMpMZ4ZPQi8wkjy5gMIPYwDTqKzHtHhdQZc9IicKWocDM5I31q4VAJjSreyAYES+ykTgbsJjDS2TAYNlsaiaS0o9ngJ3+6uQgUQTnQg3H6DK+CeMxtR1Snqvp2gfrzw1Fkr8PVGzcafgFbreflrykfSC4sL2BjbwM0luWFXdntyClNmfIhHA5hGUOId9d/Dv8aISfSe9HwF3k0xLBmkv3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+xa4t+Gc2ULHZ6eCXAcwYFZSP41g+GSB+iDKzCN8YSY=;
 b=VUD2OsBgw5gC7UVfPi1NLU0DBXF1fTL2p+8poj57cE7O/9ZuNrxwm4L/XKiLFIPC9SiZkABfQKpdt1YzxYJ+LytBHEw+cGj+3zIDnIW61lRP8AH+KBKQKnUbsjtGDvIK6cz//e9ZYCiWcFibMiKcsdfMRFRwjtT1cAzM+ZbEgBgTNnzukcizsOJjh8qlVdx7WkN8Ux9Qn2YfqZkpPlZVYe4cey2jCo5zur2d7HqZR6gweXDc+5fRH2PendSx1z5nMGOzVashljiM8dY+Y1HGV2dmtFUuf3fRHUOXElelbMKCuMB8fxfdNMI7bZSAti+FwCIy6db//bsxy1vYFVK6/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+xa4t+Gc2ULHZ6eCXAcwYFZSP41g+GSB+iDKzCN8YSY=;
 b=JLe9kM+AIT7DbXiQopIjzBU/RsHzg479V57knxM9LfXgMg7pgxXVVp/F+vi5Mb89j4YIu9cSnrIQ9DOQTherRDxdfU6WGS6QkZODgeHjZ+ow8mgxEnJNbI1j+3rjDq7vDeqKKyjx6FgC6t4JyfCyX+jrU43lse/u+6Ypu6EZ8KE=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYWPR01MB11541.jpnprd01.prod.outlook.com
 (2603:1096:400:402::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Thu, 19 Oct
 2023 00:40:19 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::a188:9424:be62:e5fb]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::a188:9424:be62:e5fb%6]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 00:40:19 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "edumazet@google.com" <edumazet@google.com>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "pabeni@redhat.com" <pabeni@redhat.com>
CC:     "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH net] ravb: Fix races between ravb_tx_timeout_work() and
 net related ops
Thread-Topic: [PATCH net] ravb: Fix races between ravb_tx_timeout_work() and
 net related ops
Thread-Index: AQHaANdzUqvglpER9EWPMMq36hSU3bBOVi4AgADupUCAAIongIAAc2og
Date:   Thu, 19 Oct 2023 00:40:19 +0000
Message-ID: <TYBPR01MB534180A2BCEA7BCC5E6D3A98D8D4A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20231017085341.813335-1-yoshihiro.shimoda.uh@renesas.com>
 <7b153bc6-2094-eee5-f506-0c1615032edb@omp.ru>
 <OSYPR01MB533414034BFE166BA7344025D8D5A@OSYPR01MB5334.jpnprd01.prod.outlook.com>
 <7da31dea-091a-5858-d3bb-928c8546a059@omp.ru>
In-Reply-To: <7da31dea-091a-5858-d3bb-928c8546a059@omp.ru>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|TYWPR01MB11541:EE_
x-ms-office365-filtering-correlation-id: 8f75b3cf-6581-46ef-bc5f-08dbd03bf872
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jKliT9szbRbz7qNfZxjKk/iOaAmaa8fA+Zm7xTehw4B8+M6s0pg4cnRkdRCaqgySHbLhJyWEOX6UucWKBASPUrq+ndelzd/1KRj9kLMqY5ILR7Re+pbkL10SPccUB6l35w92DhJMQ9tbZLlok8g/W4kXEZpe49XjAjwQEUv822hKjh1VVTLp+fE4/rF6AJC7yOvFViojtWe5YrqAubjqpgn/1QD5ZFwSlLki+TnCpdYK0E+mFnG2FhxM8gT+lyhOJ/koco/pnpDixREcjbqSj9xF+BgSbKr7sEIPIdhsZ3XaMq/JWpkycXaumyGKEpU4nrPkVuUeKDEKMXwvK2K/JhQemxUzmBnzN6CCcMcM+JnK4ZXvzxOeOBbyoYHDRHdOwBzbqlhbrxlt2Al2s7eT5wDkjrnCaPU4eqYYNIDpjR0K95GdZEYpMsxZNkXg/CH+YQfzlW+CSyzfNYMii4pJTO+pKKX0HGMIKEtYRtOdcVq8u2NGRNnv8bArNkZp+k1bgnUTO1MahK7RauwMs8iA1zTug6ySV+X4/D7FEC5gqYHaYyDbOmC2oP80SNlmighjl+oqdBVArc5AuP4Wvc1U8I8CfEuT3u+91GpEN5Fl2TXxYboy/Wt6HfaRUYPLYeY0
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(366004)(346002)(396003)(376002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(83380400001)(38100700002)(55016003)(9686003)(38070700005)(122000001)(316002)(54906003)(86362001)(66476007)(110136005)(2906002)(66556008)(76116006)(41300700001)(64756008)(5660300002)(52536014)(66446008)(66946007)(8676002)(8936002)(4326008)(478600001)(6506007)(7696005)(71200400001)(33656002)(53546011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UmdUTmZxY0xIR0dkTi85YnU1YkkyQkN0b2QxV211UFN5c04yVDFaNUlZa1Uy?=
 =?utf-8?B?VXZKTkcrTHJFWjVyUUtMNmNTMWxnTG5IQ3l3MC9OSWkwNmQyZXFhMHljZUNU?=
 =?utf-8?B?QTJkbTRudmtDOHRMKzRZRUI2N21TdXZLdkVPMXZ6YTZNd21uRkNjMFFSczFw?=
 =?utf-8?B?T3JSM0xpbGp3dklCeTViOHpCMHUyY1lLc3YrbDNEazFKUzJVaTRLYVEweFE2?=
 =?utf-8?B?Q1hlUlNvdlBiM3EwdzNKQUFNRzNRaG5memFubWdiZE5HeHlqVHcvVTVSRzU2?=
 =?utf-8?B?UDBVQXF2VXN5Yzhzd3BIYzN3U1BYQUQ2dmtDbHZRaElsR0puUk5qTnpzaURP?=
 =?utf-8?B?Y2hJOHJOTjR1UjIvWlRRM2dnWTh4eUZmS3dJZk1DRitiZGsyV3BMeEl3ZWxQ?=
 =?utf-8?B?UmlvbmRoV1ZVMFdMY291RnVlWGZtYTVaSnd3RkUrbnZidVdvVVpLQURjN2lT?=
 =?utf-8?B?M2trUDlpUUpKeTZqMmpyamJJSUdhQWNscGxDbUFxc0c2c1M5d1F5NmpQR3Ni?=
 =?utf-8?B?NG8vR2hQN2VvQ1FyYUl0aFBzQjVBbG1HUXg5WU01dHI2OXFLM3MvcnV1MVpH?=
 =?utf-8?B?NlFidzl2cFljTTdrTDErUk5UMEtIalpLS1BHV3dPN3JvOS83dVJ5VjQvblc0?=
 =?utf-8?B?SzF5TEVBUlk2bithNFJzNWs2b281Qzl3Z3ZVZld4cUNJOVRTY3lTeDRrY2tC?=
 =?utf-8?B?TGlubm1aS0p0MXN3VjAvSnpVUnZGMUl1OVA2L0doYkFmenlHVjdHV3V2cFFl?=
 =?utf-8?B?eG5GejZZRnZrNjROQnpUa3krOEdRWUh5SERtcWlnWTBpcFE2SkVoeTVVWC9n?=
 =?utf-8?B?aGVvNmtUVXQ2NFhJWktEK21VRFF4Q2ZQcXA0Z1pMbG53eFNqYi9oZVdmZFYy?=
 =?utf-8?B?Rk1XQ1Q1cEFqWWxNVlhYUHBUOWxaVTVHUEt3OXBJeExoVWhNQkp1U3ZXdFNx?=
 =?utf-8?B?Q2loYmgvMjlFWS9oeFBGcGVGT1p1UEpUYWFXdFUzOVNTejRHYkVtYS9TdWlH?=
 =?utf-8?B?Y0sycW82akRUKzhvZy92R2lyVWJGaG8zcWFuSXFhb3NoTGdzZ29pakFGSlZO?=
 =?utf-8?B?bzdzQkZYMk9jT2pGZHRscjRaZmthUitNYjhJZ04rODR5MEJTL29yRjIxV1Ja?=
 =?utf-8?B?V05yUG1CdjR2QkFqZ3pLY1M1VUNrb3ZzOHBPek03Q04yamxsTHpJKzhBSjZi?=
 =?utf-8?B?Z0M4QWI3a2p1UjVZOUcxWmQ2Vm84bmc4eXl5dzZ6SlBkY0wrMnRIWHJnU0ZT?=
 =?utf-8?B?c0xqU2lacUlScklNL2VLT2ZwRTkzWHZaYzN1QlRIeFV1NDVwZjFzU2pMemJG?=
 =?utf-8?B?WkRJSGRSQk90d29wOExMZWVEbFEwT0JsMlp0a2xxOEpMaU5EZGthYllDaWZI?=
 =?utf-8?B?SkxnTnB3c0p5ZXk2ZEJXc2NBMGRMbFVkTkF2OWN2VHpIWnRLRmU1MkEyeFVY?=
 =?utf-8?B?cndFKzRxdGtNM203djlsb2lNNllqRmRROXhiMkNDVmdkb1hQWm1MOVdGeXI0?=
 =?utf-8?B?aWlvR28wYjZTZXVOdzQzRFpBZEFPU0MxeGhmZHM1UnlnSWkvQWFvcVFCVWJm?=
 =?utf-8?B?ekdyUkxkK2JEV2VLMndKNVE1andDdk9ndWI5S0pBZ1JNSHR1blZDZjFDaEN3?=
 =?utf-8?B?bFFkbmxXbzVCWjFXQ09DSGRMNlk5aTh4Qmp5cXhuU2p2VEUyWGl6UTg4R2ll?=
 =?utf-8?B?MGNKdUpNQ1N1bkJQcWFvUXJ4MllvaXlDT3dSVUdmQXVXMXZpU2hwZ2sxeDBp?=
 =?utf-8?B?VmRlTUgzL3hNRWNoV0hRTWlsOVd4OHBnSkorcmFLbmc3dlErbjdPZlNpcURz?=
 =?utf-8?B?QVBCaWJMRUFTeHkzMU5tSGwyRFlRcHNwL2ZDc2luazR4QjVaZnRBbzNPSFdS?=
 =?utf-8?B?OFVBeFd2T3V6OGUzMnFMWHprNjdlM28xbHBjNEo4STVYUlVtRlBPYzM0SG8w?=
 =?utf-8?B?NVBDaTE5RXlZdXdrUHJXWkxwYVFNTldNR0FVTzM3UFV1ZU0rRTJobTNRaFpU?=
 =?utf-8?B?aDNkam9WZUlPSFVReUpTbkt0STBLczcySlpLU3hsTlVGRXEvSW8wWGp0cjIy?=
 =?utf-8?B?Z2NhK1F4RXVlSUxiUDFXVjlBTVZmZG9KY2Rabmh5T1lSTzdrUCtrdmFnUTlv?=
 =?utf-8?B?VEdXWUF2aVlkWEFKaWMrUG8yd0hJK3hDdEZObW5mNk5QbUtnYVJ1ZG4wNDA2?=
 =?utf-8?B?NllZcm1vNlptbFdodVZSU3h5YktpVjhlbGVyVmc5ZDJ4MTVEc01mZEpHcStr?=
 =?utf-8?B?R2RGMlgvcWpqMHd4UnhzMHNjcFNnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f75b3cf-6581-46ef-bc5f-08dbd03bf872
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2023 00:40:19.2651
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NET6RvnVv4ZC3bnlnLSa1sJTTq+ZDWL3cSPGSte/a3Yaa0fjgjwD8/CwMXvfWDURvffMCq9ssjT75CR+/N+dq0lxBSdhTTJSbbDw92tgSRbza67Ph+dufDteJ4SP9AaA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11541
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGVsbG8gU2VyZ2V5LA0KDQo+IEZyb206IFNlcmdleSBTaHR5bHlvdiwgU2VudDogVGh1cnNkYXks
IE9jdG9iZXIgMTksIDIwMjMgMjoyNyBBTQ0KPiANCj4gT24gMTAvMTgvMjMgMTI6MzkgUE0sIFlv
c2hpaGlybyBTaGltb2RhIHdyb3RlOg0KPiBbLi4uXQ0KPiA+Pj4gRml4IHJhY2VzIGJldHdlZW4g
cmF2Yl90eF90aW1lb3V0X3dvcmsoKSBhbmQgZnVuY3Rpb25zIG9mIG5ldF9kZXZpY2Vfb3BzDQo+
ID4+PiBhbmQgZXRodG9vbF9vcHMgYnkgdXNpbmcgcnRubF90cnlsb2NrKCkgYW5kIHJ0bmxfdW5s
b2NrKCkuIE5vdGUgdGhhdA0KPiA+Pj4gc2luY2UgcmF2Yl9jbG9zZSgpIGlzIHVuZGVyIHRoZSBy
dG5sIGxvY2sgYW5kIGNhbGxzIGNhbmNlbF93b3JrX3N5bmMoKSwNCj4gPj4+IHJhdmJfdHhfdGlt
ZW91dF93b3JrKCkgY2FsbHMgcnRubF90cnlsb2NrKCkgdG8gYXZvaWQgYSBkZWFkbG9jay4NCj4g
Pj4NCj4gPj4gICAgSSBkb24ndCBxdWl0ZSBmb2xsb3cuLi4gaG93IGNhbGxpbmcgY2FuY2VsX3dv
cmtfc3luYygpIGlzIGEgcHJvYmxlbT8NCj4gPj4gSSB0aG91Z2h0IHRoZSBwcm9ibGVtIHdhcyB0
aGF0IHVucmVnaXN0ZXJfbmV0ZGV2KCkgY2FuIGJlIGNhbGxlZCB3aXRoDQo+ID4+IHRoZSBUWCB0
aW1lb3V0IHdvcmsgc3RpbGwgcGVuZGluZz8gQW5kLCBtb3JlIGdlbmVyYWxseSwgc2hvdWxkbid0
IHdlDQo+ID4+IHByb3RlY3QgYWdhaW5zdCB0aGUgVFggdGltZW91dCB3b3JrIGJlaW5nIGV4ZWN1
dGVkIG9uIGEgZGlmZmVyZW50IENQVQ0KPiA+PiB0aGFuIHRoZSB7bmV0X2RldmljZXxldGh0b29s
fV9vcHMgbWV0aG9kcyBhcmUgYmVpbmcgZXhlY3V0ZWQgKGlzIHRoYXQNCj4gPj4gcG9zc2libGU/
KT8NCj4gPg0KPiA+IF9fZGV2X2Nsb3NlX21hbnkoKSBpbiBuZXQvY29yZS9kZXYuYyBjYWxscyBB
U1NFUlRfUlROTCgpIGFuZCBvcHMtPm5kb19zdG9wKCkuDQo+ID4gU28sIHRoZSByYXZiX2Nsb3Nl
KCkgaXMgdW5kZXIgcnRubCBsb2NrLiBXaGlsZSBsb2NraW5nIHRoZSBydG5sLCBpdCdzDQo+ID4g
cG9zc2libGUgdG8gY2FsbCByYXZiX3R4X3RpbWVvdXRfd29yaygpIG9uIG90aGVyIENQVS4gSW4g
c3VjaCBhIGNhc2UsDQo+ID4gaXQncyBwb3NzaWJsZSB0byBjYXVzZSBhIGRlYWRsb2NrIGJldHdl
ZW4gcmF2Yl9jbG9zZSgpIGFuZCByYXZiX3R4X3RpbWVvdXRfd29yaygpDQo+ID4NCj4gPiBDUFUw
CQkJCUNQVTENCj4gPiAJCQkJcmF2Yl90eF90aW1lb3V0KCkNCj4gPiAJCQkJc2NoZWR1bGVfd29y
aygpDQo+ID4gLi4uDQo+ID4gX19kZXZfY2xvc2VfbWFueSgpDQo+ID4gLy8gdGhpcyBpcyB1bmRl
ciBydG5sIGxvY2sNCj4gPiByYXZiX2Nsb3NlKCkNCj4gPiBjYW5jZWxfd29ya19zeW5jKCkNCj4g
PiAJCQkJcmF2Yl90eF90aW1lb3V0X3dvcmsoKQ0KPiA+IAkJCQlydG5sX2xvY2soKQ0KPiA+IAkJ
CQkvLyB0aGlzIGlzIHBvc3NpYmxlIHRvIGNhdXNlIGEgZGVhZGxvY2sNCj4gDQo+ICAgIEFoLCBj
YW5jZWxfd29ya19zeW5jKCkgbWVhbnMgd2UgaGF2ZSB0byB3YWl0IGZvciB0aGUgd29yayB0bw0K
PiBmaW5pc2ggLS0gaW5kZWVkIGEgZGVhZGxvY2sgaXMgcG9zc2libGV0IHRoZW4uDQoNClRoYW5r
IHlvdSBmb3IgeW91ciByZXBseS4gSSdsbCB1cGRhdGUgY29tbWl0IGRlc2NyaXB0aW9uIGluIHYy
Lg0KDQo+ID4+ICAgIEkgYWxzbyBoYWQgYSBzdXNwaWNpb24gdGhhdCB3ZSBzdGlsbCBtaXNzIHRo
ZSBzcGlubG9jayBjYWxscyBpbg0KPiA+PiByYXZiX3R4X3RpbWVvdXRfd29yaygpIGJ1dCBub3Ro
aW5nIGluIHBhcnRpY3VsYXIganVtcGVkIGF0IG1lLi4uDQo+IA0KPiAgICBXZSBtYWlubHkgbmVl
ZCB0byBwcm90ZWN0IGFnYWluc3QgdGhlIGludGVycnVwdHMgaW4gdGhpcyBjYXNlLi4uDQoNCkkg
dGhpbmsgc28uIEhvd2V2ZXIsIHdlIGNhbiBub3QgdXNlIHNwaW5fbG9ja19pcnFzYXZlKCkgZm9y
IHdob2xlIHRoaXMNCnJhdmJfdHhfdGltZW91dF93b3JrKCkgYmVjYXVzZSByYXZiX3JpbmdfaW5p
dCgpIGNhbGxzIGtjYWxsb2MoKSB3aXRoIEdGUF9LRVJORUwuDQoNCj4gPj4gbWluZCBsb29raW5n
IGludG8gdGhhdD8gOi0pDQo+ID4NCj4gPiBZZXMsIHBlcmhhcHMgd2UgaGF2ZSB0byBjaGVjayBp
dCBzb21laG93Li4uDQo+IA0KPiAgICBVbmZvcnR1bmF0ZWx5LCBJIGRvbid0IHNlZW0gdG8gaGF2
ZSBubyBiYW5kd2lkdGggdG8gZG8gdGhhdCBteXNlbGYuLi4NCg0KSSBnb3QgaXQuIEknbGwgaW52
ZXN0aWdhdGUgdGhpcyBsYXRlci4NCg0KQmVzdCByZWdhcmRzLA0KWW9zaGloaXJvIFNoaW1vZGEN
Cg0KPiBbLi4uXQ0KPiANCj4gTUJSLCBTZXJnZXkNCg==
