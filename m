Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C3DD6FAFA8
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 May 2023 14:09:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233405AbjEHMJg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 May 2023 08:09:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232166AbjEHMJe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 May 2023 08:09:34 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2130.outbound.protection.outlook.com [40.107.114.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B25933875;
        Mon,  8 May 2023 05:09:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HrzQZ59J1KmjplcUJ9RtLwv5Mss0BX/6DaZvCa/jdjrLTxHNirA8jVNUh7s+3fcJclAo/EAdSywj90SN5qWrFYZeT5VsF+GPtVArKK5Z1bsbNTJMZYzzp4LwJSFsA5S4Yu9f3tROjGuBKRcm8cr7tEP8hUNrXBM+Eq07hzP0YYBT2DQ4FSKG1W5qPiC7awDspi2jADgi8zgnz0IbabcJNghZJjIScLt95gt4GSRzPDBE3SP6fRoqug+6BBEuBLYBOBCWn7PTaOXPWLuCCtKLCbr0vjY9179dpKksxJSSqHbj0SnikKDPJCO77RSX6NB7uPnC8xCYpwmnxRtK1D0T6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GgXlLJ26MoN8f43RSfvCntI4DaFRF+PEHmBPIMj+XQM=;
 b=afIG70C2udpI6vScT6Ombk76S3bOb6Lalxfn6UII0fBSEsIFkm2kJy3w42DRBMW5T2tLUqtxwGrnf6k/+Y03/6Pbq+8cJZ7dd77EZzVvJu8WtJ4F/h94Egk3Ipeo7cKOW9yGKuCGScApjA61cRQhlMQ9+0EaBbgIWzHwlXLD/rXl9x3oRlGgI0OK7+CKJ6HiTF5Gyk30Ay11OU+YpgFrciccp38uAkaygEEj2nmjUpR8GE2BvQhUjF7tjEwadPm9m0zQbL6j8orkw181z/CzseJo1KSHVcfsrTcdgDx3Yi3X0RBNvud986pKmCv1cWbDMGmMZYEFaoEsXH9ceUycog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GgXlLJ26MoN8f43RSfvCntI4DaFRF+PEHmBPIMj+XQM=;
 b=jSLhgXgQSvYvSHMwYAhRbwWt/9Dy4DuZ5u2mX2ZsiLiSpcM0OCm9n69u7TDyM/PgYSfAlIXjKq9KnFfEfY/wdGCXyyXnBVtYM4pV3fc+0Elf7nRFKI721wHqwd9ZLjq78+FjIgtDkzWtRylpAmTX0stSlQ01w2uLqW9AcZQajMA=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by OSZPR01MB8009.jpnprd01.prod.outlook.com
 (2603:1096:604:1b9::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.31; Mon, 8 May
 2023 12:09:29 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::5198:fdcf:d9b1:6003]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::5198:fdcf:d9b1:6003%7]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 12:09:29 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC:     "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        linux-pci <linux-pci@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: RE: [PATCH v2] arm64: dts: renesas: Add IOMMU related properties into
 PCIe host nodes
Thread-Topic: [PATCH v2] arm64: dts: renesas: Add IOMMU related properties
 into PCIe host nodes
Thread-Index: AQHZeBkM8dfkmPmDtUGCO6+tXtf+Qa9IiDmAgAE+5gCABpKzoA==
Date:   Mon, 8 May 2023 12:09:29 +0000
Message-ID: <TYBPR01MB5341CF1EC3BF49F707029C13D8719@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20230426082812.3621678-1-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXBq0XZwgSUTQSrdYiQ0C0WBaHETqNLfF766TiXoCkKhg@mail.gmail.com>
 <20230504074012.GA4162@thinkpad>
In-Reply-To: <20230504074012.GA4162@thinkpad>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|OSZPR01MB8009:EE_
x-ms-office365-filtering-correlation-id: c996025c-cc7c-4db9-4aae-08db4fbd1375
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ilvi/qBwemccIQcTi2c41Ezenr+Q+YLNmRDAm7kObwEIvNyrmr1mwZ3M3TWjPwz5W6D6g0plvol3gs2da2zHowXhi2/Ai7hpEe/tQtMa9h0eqEhpwxPIqR7Eu+S8m9ZQvhNnybLnS+f2C9r0DNt4ZUwphLo5F1051BW5ziX5/YS7A4Gh3tGE7Pm5fDA5P/J5NAkuqPC8KELweYH7+s+je9ctil6qoEy3UPDSC9P+qi3Qlm7Mslk4xZxc1ipx0HreesJCw1qI0NMFPIaGVy35n7v1N3Hbohg/bzgRJrFA/hyiWGOozOTf+LywUnzC1oSImGYiZrntM/xnk8VXdoqMxKaIyfx8tPHR4EH0yID8UK/XNnIguT7BkEVf/6I97LFhvxUR0ie+48mBksxuw1vUGd8aq5q49ziTKY9NimXLVFcICAJ+koSRMsvZ/cGZmw3RFdlfnYEoVltNr5HUz8kE5yEbC8GHBuOw9GWW1JyuMQdbzVRC9rRka30nlgeraMltcOJqp+td1CPOrTtVel3YLrm1sPtVuor91CN++ebmMuRXoSJCA/ZnOg8chzCELJhHWhQ+GZPAkMRJgnLPtulIE+WmYp6I0H2bYkNR9glDYvbYNQcl6ysn5VrMRQvbzEgx
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(451199021)(122000001)(38100700002)(38070700005)(33656002)(86362001)(8676002)(8936002)(7696005)(5660300002)(478600001)(52536014)(55016003)(9686003)(53546011)(83380400001)(316002)(2906002)(41300700001)(6916009)(71200400001)(76116006)(66476007)(66946007)(54906003)(66556008)(64756008)(66446008)(186003)(6506007)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?djNkRkNKYTlWdkhxK0FiYXUyS2xYZVFoaW9uczZlZm00cExTMVN3OUZ2RlEv?=
 =?utf-8?B?WHlBYi9Fb0Z1RE81bjdpT2JWZUh1SnRWMkFrQ0IyNGdsQWh6WW53K291bkZt?=
 =?utf-8?B?VkRBOThvVVNjWlJwTDNRN1ZaS2dmK2dEdkl3WWp0K1RJalFKS0kyUUdYcEhh?=
 =?utf-8?B?UEJtYmplR0pRb2J6bkJ6R2hQRzdrUndIbExHMnNCWWlMcFpoYlg2Ni94MkpQ?=
 =?utf-8?B?K3R6OHR2L2lveWNIVTZHYlBWSW9XclVUaTdSdHBJN1hOczV1dmVCQTlqY01l?=
 =?utf-8?B?WGpqdC9YZDFJR0h0R3d5UDh4OTR6ZUR1V1p6VXZtYU85aDJkT013RWdVZDl3?=
 =?utf-8?B?dDhjdWZYU2k0QURYZ0dFKzM5NjVkb1dqYVFDZ1RXSzF1WUl3Q2doV3BRTldI?=
 =?utf-8?B?RUphR3V4Ni9QM1I2ODI3ZXdkdFdKU2tWQUV4MzZVbk9Najdua0laRmpvZito?=
 =?utf-8?B?UDhaMmFEMDVBc0luRmpheVZuRmtHYWFnTmRvSy9SWVpYVlRpS2ZQZk9mcHlp?=
 =?utf-8?B?TkxDb2U4Vm9RbUh4VmxURFRMbnBQUTYxUkRsK1E1MmFsRFlVbU1VRy9GWERJ?=
 =?utf-8?B?MHlrQU5tNWpLaEtKY1pUNVB5R3RpeDd1bUZITXN2cGg1cWpGRWRHWkE1azU5?=
 =?utf-8?B?NXgweHg4cGJTa1RWU3liazdvT0JKemI2bFp0bVNTdHZ0WVkySEU2NGxDN0Jk?=
 =?utf-8?B?aXJMR3g3UFVSbVpudzBKclhLRVhjbHk1WEVTOHZvRmxGZjUyRzl3Vzg3aURU?=
 =?utf-8?B?NFZrS05sUnI2R2xaTWlaL0dVVTdaN3k2aXkxSXg4N3NaYlhOZjV5WC9tZjNx?=
 =?utf-8?B?SjByd0NzcW5lZGUvdTNGR0F3VGFSUWJrOUVqTDBORzlJUGlhSlpXWTNEOS9C?=
 =?utf-8?B?aTlkM3cxWHI2VHlsRFZ1TDZiUEFFVWlKQ2RsNHNXNWxxT3ZBV2NWcFlkcG9s?=
 =?utf-8?B?QkdrSGxsa3FqN0JkSFZtek1YUHEwbllra205dzRGTTJzNEYzMjJianRpYUFx?=
 =?utf-8?B?L0lCeVNYbG9BT2pJWFMxLzZJeDVnSllSSm5VV1FrRVFYMDZCUzd1Mm1rNG4x?=
 =?utf-8?B?OHhnbkYwdFBLU3ZTVWVadXU2OWtIZTZtd1pSM1ZiTkxDSXF0bjBNYmNGbkhH?=
 =?utf-8?B?RVpVL25XbTUvQU5tSEEycnY3TGxleXVqUUR0ZXh2dXpua2g2V25KTE1pc0d0?=
 =?utf-8?B?b1JPalRJNUFMclYwWW54SlpGMHE4Rm5TSWlOYmFCK0hyUFJiWUxHa0VpeTJt?=
 =?utf-8?B?SUUvVlVmTWd3Sng3cmJKd2JGanNuaytoQ051OC9jcGtIVzlHZ282SFZFejBK?=
 =?utf-8?B?WU02WjQ5ZUNtSHdYVE1hUFNGTmxjQ284OGlxaHFpUk9qSXlJUjJXS3BxZzY1?=
 =?utf-8?B?UUxuNFZwUHBTaXVvVUdTZG5reGJtcjZReGF2QkNwNHpidDJuS3VhZ2JoWWF6?=
 =?utf-8?B?a0R6M3hqaWRUbE5WRVVuYkdTR1ltZldEVFhHM2VNU2FyWlpTZ2V5M2dPZURD?=
 =?utf-8?B?M3pWUXNaSDBoQlFuR0NNd21NZnU1K20vU0tZN01tc00veDcxYUd5WFkwK1RF?=
 =?utf-8?B?aVZBUzZocjVBNzZiZURCd2FsTUtYUUxaNEZhKzZzV0dURXMzbXFUUWZhMDZj?=
 =?utf-8?B?NFRRRStMQmdLd2h1Q1ZITFdXbHRraXIvQUtjb2tYOEFFZEhYTVRianN6cEMy?=
 =?utf-8?B?L24yZzJzQmVWamdnUGxlZWVCTGdWT0swcmE1Q1RIcFMxZW1PNXRiZ0crWnVw?=
 =?utf-8?B?MmRmU1o4cDFIQ0Q5SHFoS0JDcE4zNjViWlVsWnM3S0ZqZ0RMRjdUckRaYTdm?=
 =?utf-8?B?a0hNVCtWK2FZWWVjbTQ5S0pSNkdWbjFZZFZ1WEZRRUxscjAza1ZrdnhpSnVQ?=
 =?utf-8?B?bU4wUUdlcGVlaVVHcHB3L2t6aWJlS1hjeXFCVnNzYTlNOTRhQSswNE1ORCtQ?=
 =?utf-8?B?enFhUUJORklzOERmcDgydHlQRlUrT24zQWxGTVVQb09ZdnU1NG9RRjZIOXRC?=
 =?utf-8?B?SlRYVXR5UlpPWnM3Sk5iN2RNN2JtM2VzdjVDM1g2WloxOHg4cmxYeUVyakVJ?=
 =?utf-8?B?WXROY2p4UWkxcS93RjhvbzQ5QmVxSDNpcnFFbHZaandIZmthWEMvR3hkZU1X?=
 =?utf-8?B?a3ovdTZNaHEzSVBPTmFMNDVUbit3eFdXeVlPSzhRMmVVSnMySkhtK0o1cjMz?=
 =?utf-8?B?TnJxaGNzc0tzRWl3MUgyZS82U1M3TGhzMW1jOVp0TkdyRG5MQkFjTWJOa1RS?=
 =?utf-8?B?QVMrZzdNdllucG45MjJYeUt4M1J3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c996025c-cc7c-4db9-4aae-08db4fbd1375
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2023 12:09:29.6801
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B5Hy97V7ZkbZX+vQ3LAkTMiQiUTlCqKLtxrcQFGDq2KlaMnR4FOensBak9/bB19WV5HFuGK363Yi2z4qA3Cf/3B1IEj3vQd2mG+Ci7fYxXtHSks1byF6r4yZR7KmuNPJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8009
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgTWFuaXZhbm5hbiwNCg0KPiBGcm9tOiBNYW5pdmFubmFuIFNhZGhhc2l2YW0sIFNlbnQ6IFRo
dXJzZGF5LCBNYXkgNCwgMjAyMyA0OjQwIFBNDQo+IA0KPiBPbiBXZWQsIE1heSAwMywgMjAyMyBh
dCAwMjozODo0OVBNICswMjAwLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6DQo+ID4gSGkgU2hp
bW9kYS1zYW4sDQo+ID4NCj4gPiBDQyBsaW51eC1wY2kNCj4gPg0KPiA+IE9uIFdlZCwgQXByIDI2
LCAyMDIzIGF0IDEwOjI44oCvQU0gWW9zaGloaXJvIFNoaW1vZGENCj4gPiA8eW9zaGloaXJvLnNo
aW1vZGEudWhAcmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gQWRkIGlvbW11LW1hcCBhbmQgaW9t
bXUtbWFwLW1hc2sgcHJvcGVydGllcyBpbnRvIFBDSWUgaG9zdCBub2Rlcy4NCj4gPiA+IE5vdGUg
dGhhdCBpb21tdS1tYXAtbWFzayBzaG91bGQgYmUgemVybyBiZWNhdXNlIHRoZSBJUE1NVSBhc3Np
Z25zDQo+ID4gPiBvbmUgbWljcm8gVExCIElEIG9ubHkgdG8gdGhlIFBDSWUgaG9zdC4NCj4gPiA+
DQo+IA0KPiBXaGF0IGRvIHlvdSBtZWFuIGJ5ICJvbmx5IHRvIHRoZSBQQ0llIGhvc3QiPyBBcmUg
eW91IHJlZmVycmluZyB0byB0aGUgaG9zdA0KPiBicmlkZ2UgaW4gdGhlIFNvQz8NCg0KT29wcy4g
SSBpbnRlbmRlZCB0byBtZWFuICJvbmUgbWljcm8gVExCIElEIG9ubHkiLiBUaGUgU29DIGRvZXNu
J3QgaGF2ZQ0KYW55IGhvc3QgYnJpZGdlLiBTbywgSSBzaG91bGQgaGF2ZSBtZW50aW9uZWQgdGhh
dCAidGhlIElQTU1VIGFzc2lnbnMgb25lIG1pY3JvDQpUTEIgSUQgb25seSwgdG8gdGhlIFBDSWUg
aG9zdC4iLg0KDQo+ID4gPiBBbHNvIGNoYW5nZSBkbWEtcmFuZ2VzIGFyZ3VtZW50cyBmb3IgSU9N
TVUuIE5vdGVzIHRoYXQgdGhlIGRtYS1yYW5nZXMNCj4gPiA+IGNhbiBiZSB1c2VkIGlmIElPTU1V
IGlzIGRpc2FibGVkLg0KPiA+ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFlvc2hpaGlybyBTaGlt
b2RhIDx5b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4NCj4gPg0KPiA+IFRoYW5rcyBm
b3IgeW91ciBwYXRjaCENCj4gPg0KPiA+IFRoaXMgaXMgbm90IHJlYWxseSBteSBhcmVhIG9mIGV4
cGVydGlzZSwgYnV0IHlvdSBjYW4gc3RpbGwgZmluZCBzb21lDQo+ID4gcXVlc3Rpb25zIGFuZCBj
b21tZW50cyBiZWxvdy4uLg0KPiA+DQo+ID4gPiAtLS0NCj4gPiA+ICBDaGFuZ2VzIGZyb20gdjE6
DQo+ID4gPg0KPHNuaXAgVVJMPg0KPiA+ID4gIC0gRHJvcCBpb21tdXMgcHJvcGVydHkuDQo+ID4g
PiAgLSBBZGQgaW9tbXUtbWFwLW1hc2sgcHJvcGVydHkuDQo+ID4gPiAgLSBSZXZpc2UgdGhlIGNv
bW1pdCBkZXNjcmlwdGlvbi4NCj4gPiA+DQo+ID4gPiAgYXJjaC9hcm02NC9ib290L2R0cy9yZW5l
c2FzL3I4YTc3OTUxLmR0c2kgfCAxMiArKysrKysrKy0tLS0NCj4gPiA+ICBhcmNoL2FybTY0L2Jv
b3QvZHRzL3JlbmVzYXMvcjhhNzc5NjAuZHRzaSB8IDEyICsrKysrKysrLS0tLQ0KPiA+ID4gIGFy
Y2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3Nzk2MS5kdHNpIHwgMTIgKysrKysrKystLS0t
DQo+ID4gPiAgYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTY1LmR0c2kgfCAxMiAr
KysrKysrKy0tLS0NCj4gPiA+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5OTAu
ZHRzaSB8ICA2ICsrKystLQ0KPiA+ID4gIDUgZmlsZXMgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygr
KSwgMTggZGVsZXRpb25zKC0pDQo+ID4gPg0KPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvcmVuZXNhcy9yOGE3Nzk1MS5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5l
c2FzL3I4YTc3OTUxLmR0c2kNCj4gPiA+IGluZGV4IDEwYjkxZTk3MzNiZi4uMmFkZWM4YjZjOTNm
IDEwMDY0NA0KPiA+ID4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTUx
LmR0c2kNCj4gPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3Nzk1MS5k
dHNpDQo+ID4gPiBAQCAtMjc3OCw4ICsyNzc4LDggQEAgcGNpZWMwOiBwY2llQGZlMDAwMDAwIHsN
Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwweDAyMDAwMDAwIDAgMHhm
ZTIwMDAwMCAwIDB4ZmUyMDAwMDAgMCAweDAwMjAwMDAwPiwNCj4gPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIDwweDAyMDAwMDAwIDAgMHgzMDAwMDAwMCAwIDB4MzAwMDAwMDAg
MCAweDA4MDAwMDAwPiwNCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDww
eDQyMDAwMDAwIDAgMHgzODAwMDAwMCAwIDB4MzgwMDAwMDAgMCAweDA4MDAwMDAwPjsNCj4gPiA+
IC0gICAgICAgICAgICAgICAgICAgICAgIC8qIE1hcCBhbGwgcG9zc2libGUgRERSIGFzIGluYm91
bmQgcmFuZ2VzICovDQo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICBkbWEtcmFuZ2VzID0g
PDB4NDIwMDAwMDAgMCAweDQwMDAwMDAwIDAgMHg0MDAwMDAwMCAwIDB4NDAwMDAwMDA+Ow0KPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgLyogTWFwIGFsbCBwb3NzaWJsZSBERFIvSU9NTVUg
YXMgaW5ib3VuZCByYW5nZXMgKi8NCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGRtYS1y
YW5nZXMgPSA8MHg0MjAwMDAwMCAwIDB4MDAwMDAwMDAgMCAweDAwMDAwMDAwIDEgMHgwMDAwMDAw
MD47DQo+ID4NCj4gPiBTbyB0aGlzIGlzIGxpbWl0ZWQgdG8gdGhlIGZpcnN0IDQgR2lCIG9mIERE
UiAoRERSMCksIGkuZS4gdG8gMzItYml0DQo+ID4gYWRkcmVzcyBzcGFjZT8gU2hvdWxkbid0IHRo
aXMgaW5jbHVkZSBERFIxLzIvMz8NCj4gPg0KPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
aW50ZXJydXB0cyA9IDxHSUNfU1BJIDExNiBJUlFfVFlQRV9MRVZFTF9ISUdIPiwNCj4gPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPEdJQ19TUEkgMTE3IElSUV9UWVBFX0xFVkVM
X0hJR0g+LA0KPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8R0lDX1NQSSAx
MTggSVJRX1RZUEVfTEVWRUxfSElHSD47DQo+ID4gPiBAQCAtMjc5MCw2ICsyNzkwLDggQEAgcGNp
ZWMwOiBwY2llQGZlMDAwMDAwIHsNCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGNsb2Nr
LW5hbWVzID0gInBjaWUiLCAicGNpZV9idXMiOw0KPiA+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgcG93ZXItZG9tYWlucyA9IDwmc3lzYyBSOEE3Nzk1X1BEX0FMV0FZU19PTj47DQo+ID4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICByZXNldHMgPSA8JmNwZyAzMTk+Ow0KPiA+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgaW9tbXUtbWFwID0gPDAgJmlwbW11X2hjIDAgMHgxMDAwMD47DQo+
ID4NCj4gPiBSZWFkaW5nDQo+ID4NCjxzbmlwIFVSTD4NCj4gPiB0aGUgYWJvdmUgbWVhbnMgeW91
IG1hcCA2NTUzNiBSSURzIG4gaW4gdGhlIHJhbmdlIDAuLjY1NTM1DQo+ID4gdG8gIDwmaXBtbXVf
aGMgbj4sIHdoaWxlIG9ubHkgbWljcm8tVExCcyAwIGFuZCAxIGFyZSBhc3NpZ25lZCB0byBQQ0ll
Pw0KPiA+DQo+ID4gSGVuY2UgSSB0aGluayB0aGlzIHNob3VsZCBiZToNCj4gPg0KPiA+ICAgICBp
b21tdS1tYXAgPSA8MCAmaXBtbXVfaGMgMCAxPjsNCj4gPg0KPiANCj4gSWYgdGhlcmUgYXJlIG5v
IFBDSS1QQ0kgYnJpZGdlcyBpbiB0aGUgU29DLCB0aGVuIHRoZSBkZXZpY2VzIGNvbm5lY3RlZCB0
byB0aGUNCj4gaG9zdCBicmlkZ2Ugc2hvdWxkIHNoYXJlIHRoZSBzYW1lIGJ1cyBudW1iZXIgaS5l
LiwgMDA6MDAuMCB0byAwMC4xZi44LiBJbiB0aGF0DQo+IGNhc2UsIHlvdSBzaG91bGQgaGF2ZSB0
aGUgaW9tbXUtbWFwIGFzIHBlciBHZWVydCdzIHN1Z2dlc3Rpb24uIFBhaXJlZCB3aXRoDQo+IGlv
bW11LW1hcC1tYXNrIG9mIDAsIHRoaXMgaW1wbGllcyB0aGF0IGFsbCB0aGUgZGV2aWNlcyBhbmQg
ZnVuY3Rpb25zIG9mIGJ1cyAwDQo+IHdpbGwgc2hhcmUgdGhlIHNhbWUgUklELg0KPiANCj4gVGhp
cyBob2xkcyB0cnVlIGZvciBvdGhlciBpbnN0YW5jZSBhcyB3ZWxsLg0KDQpUaGFuayB5b3UgZm9y
IHRoZSBjb21tZW50cy4gSSdsbCBmaXggdGhpcyBwYXRjaC4NCg0KQmVzdCByZWdhcmRzLA0KWW9z
aGloaXJvIFNoaW1vZGENCg0KPiAtIE1hbmkNCj4gDQo+ID4gPiArICAgICAgICAgICAgICAgICAg
ICAgICBpb21tdS1tYXAtbWFzayA9IDwwPjsNCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
IHN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+ID4gPiAgICAgICAgICAgICAgICAgfTsNCj4gPiA+DQo+
ID4gPiBAQCAtMjgwNSw4ICsyODA3LDggQEAgcGNpZWMxOiBwY2llQGVlODAwMDAwIHsNCj4gPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwweDAyMDAwMDAwIDAgMHhlZWEwMDAw
MCAwIDB4ZWVhMDAwMDAgMCAweDAwMjAwMDAwPiwNCj4gPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIDwweDAyMDAwMDAwIDAgMHhjMDAwMDAwMCAwIDB4YzAwMDAwMDAgMCAweDA4
MDAwMDAwPiwNCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwweDQyMDAw
MDAwIDAgMHhjODAwMDAwMCAwIDB4YzgwMDAwMDAgMCAweDA4MDAwMDAwPjsNCj4gPiA+IC0gICAg
ICAgICAgICAgICAgICAgICAgIC8qIE1hcCBhbGwgcG9zc2libGUgRERSIGFzIGluYm91bmQgcmFu
Z2VzICovDQo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICBkbWEtcmFuZ2VzID0gPDB4NDIw
MDAwMDAgMCAweDQwMDAwMDAwIDAgMHg0MDAwMDAwMCAwIDB4NDAwMDAwMDA+Ow0KPiA+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgLyogTWFwIGFsbCBwb3NzaWJsZSBERFIvSU9NTVUgYXMgaW5i
b3VuZCByYW5nZXMgKi8NCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGRtYS1yYW5nZXMg
PSA8MHg0MjAwMDAwMCAwIDB4MDAwMDAwMDAgMCAweDAwMDAwMDAwIDEgMHgwMDAwMDAwMD47DQo+
ID4NCj4gPiBMaWtld2lzZS4NCj4gPg0KPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgaW50
ZXJydXB0cyA9IDxHSUNfU1BJIDE0OCBJUlFfVFlQRV9MRVZFTF9ISUdIPiwNCj4gPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgPEdJQ19TUEkgMTQ5IElSUV9UWVBFX0xFVkVMX0hJ
R0g+LA0KPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8R0lDX1NQSSAxNTAg
SVJRX1RZUEVfTEVWRUxfSElHSD47DQo+ID4gPiBAQCAtMjgxNyw2ICsyODE5LDggQEAgcGNpZWMx
OiBwY2llQGVlODAwMDAwIHsNCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGNsb2NrLW5h
bWVzID0gInBjaWUiLCAicGNpZV9idXMiOw0KPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
cG93ZXItZG9tYWlucyA9IDwmc3lzYyBSOEE3Nzk1X1BEX0FMV0FZU19PTj47DQo+ID4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICByZXNldHMgPSA8JmNwZyAzMTg+Ow0KPiA+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgaW9tbXUtbWFwID0gPDAgJmlwbW11X2hjIDEgMHgxMDAwMD47DQo+ID4N
Cj4gPiBMaWtld2lzZSwgdGhlIGFib3ZlIG1lYW5zIHlvdSBtYXAgNjU1MzYgUklEcyBuIGluIHRo
ZSByYW5nZSAwLi42NTUzNQ0KPiA+IHRvICA8JmlwbW11X2hjICgxICsgbik+Pw0KPiA+DQo+ID4g
SGVuY2UgSSB0aGluayB0aGlzIHNob3VsZCBiZToNCj4gPg0KPiA+ICAgICBpb21tdS1tYXAgPSA8
MCAmaXBtbXVfaGMgMSAxPjsNCj4gPg0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgaW9t
bXUtbWFwLW1hc2sgPSA8MD47DQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICBzdGF0dXMg
PSAiZGlzYWJsZWQiOw0KPiA+ID4gICAgICAgICAgICAgICAgIH07DQo+ID4NCj4gPiBTYW1lIGNv
bW1lbnQgZm9yIGFsbCBvdGhlciBjaGFuZ2VzLg0KPiA+DQo+ID4gSW4gYWRkaXRpb24sIHdlIG5l
ZWQgc2ltaWxhciBjaGFuZ2VzIHRvIHI4YTc3NHthMSxiMSxjMCxlMX0uZHRzaSwNCj4gPiBhbmQg
c2xpZ2h0bHkgZGlmZmVyZW50IGNoYW5nZXMgKHVzaW5nIGlwbW11X3ZpMCB1VExCIDUpIHRvIHI4
YTc3OTgwLmR0c2kuDQo+ID4NCj4gPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gPg0KPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+ID4NCj4gPiAtLQ0KPiA+IEdlZXJ0IFV5dHRlcmhv
ZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgt
bTY4ay5vcmcNCj4gPg0KPiA+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmlj
YWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQNCj4gPiB3aGVuIEknbSB0YWxr
aW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBs
aWtlIHRoYXQuDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBU
b3J2YWxkcw0KPiANCj4gLS0NCj4g4K6u4K6j4K6/4K614K6j4K+N4K6j4K6p4K+NIOCumuCupOCu
vuCumuCuv+CuteCuruCvjQ0K
