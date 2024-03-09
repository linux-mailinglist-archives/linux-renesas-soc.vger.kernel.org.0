Return-Path: <linux-renesas-soc+bounces-3625-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7688F877059
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 Mar 2024 11:21:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B5A5281C8D
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 Mar 2024 10:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF07B381D1;
	Sat,  9 Mar 2024 10:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="C7Ws3EWj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2069.outbound.protection.outlook.com [40.107.113.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A214C90;
	Sat,  9 Mar 2024 10:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709979673; cv=fail; b=exSwrET8pbZnQKpG5XX64W4hnpZbtlUetiK8tsGZ6Vc3JaDfW6eFHJC4E3ygXmM4OzuPIzeERfA3oBngKaIiopV7JWAdKMcmFMcsh2OjA0Uc6tC+sztz4+3Y5pwJ66+bv5eHf3yGQzL4LiiGSdzL21xo1Y6S7jPjkWDmHG2y3+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709979673; c=relaxed/simple;
	bh=NDC9mSXxYIvqEv37Q9IcGMmxLgATssE6WxjxvFX+zHY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pw5TpWFSQIGykNl4yVoXhkyKKdANPgnyNoCaDvQxffK0Daeg2Pq3mKEIoSfVoJA55H0G8VDIMb98rluF1u09PQJmQEmb2HrH9uFg7Y/Fw6W2uLaPNieJEBAR+MPXGjFMBq1MevGfvhp0qf1T4p7iMSbl7bLuMqylwc1TBis/bmk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=C7Ws3EWj; arc=fail smtp.client-ip=40.107.113.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cA/V39C52qZ4c9j2Tul1KyUhQISd4E1DT4tFLMsQ4zCPF2hTuCcAriqDXyPKm+AcnNIXy8o4ebAJmI/5xbOV1EdQg17RBMNWtWs10crux23338XyQ2UcTZI6MJvERKobd4CnHw/2fhJfhdonIO+LO/grQAMpLx6PnGoTB2SZqphtJmXzDfC1RRpq5GRdXruFzNqrmMXtErwwAJ8tr7p+8j03kRktdvpCGtnY4F3sLkP2QzADfDciL71StYqeOaHOeo5YCP3OFPELaucqGNPHz8A62N0ExJVvEZMwdYe+GCidtshIum2xzLWyPjKYVQM+GlBvpodMJND35/yGcmkhJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NDC9mSXxYIvqEv37Q9IcGMmxLgATssE6WxjxvFX+zHY=;
 b=KffwdnzsarrJflC07ZkADJYCBgCdH6AontL7P4G7tVwLnD8HjN7rHM5sRsASC+X0WlKyMbEh6clSMvcGRfEkbrEdLMxmJVDOtYtZ7kpKAUVpEqgPwS7M5cc8yz2rox/GoNz1plDV/EbFS33TTAlbd9LgYhbzish1hBr5SINXTIdKya77fnu52hNxwoa+II0Hm6sTC5YR+L5vaRHTT4a6T4x8JAz+OcfPmzY9ZpfN6UfLV0BabVqpZMXcNpA+kne8KKK/wDeoSgq9MBdH7bjNtQeG0Spj37AwxKZsAeVnvnjfxBoYKP0OgKYs3iK7W7CzzT7G2EVRu+8eKN7xReUWcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NDC9mSXxYIvqEv37Q9IcGMmxLgATssE6WxjxvFX+zHY=;
 b=C7Ws3EWjOOfH1gpdC4tS41I+UtlgC/HCbbqzC1TDysqPjGOBn1arR0JojGpG15XJl0RRLixFf2gOrG+Hk2d+K0eOUYEM0pT9NFQLAoUxWs64znMI1bRgE5/aQbGs0dF2IXfr23ygwlpy/9otJWRtjFD26gQpyGWF9BRKKyAc2K0=
Received: from OSAPR01MB1587.jpnprd01.prod.outlook.com (2603:1096:603:2e::16)
 by OS3PR01MB7127.jpnprd01.prod.outlook.com (2603:1096:604:125::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.31; Sat, 9 Mar
 2024 10:21:04 +0000
Received: from OSAPR01MB1587.jpnprd01.prod.outlook.com
 ([fe80::5ff4:8ba7:96e5:7a5b]) by OSAPR01MB1587.jpnprd01.prod.outlook.com
 ([fe80::5ff4:8ba7:96e5:7a5b%7]) with mapi id 15.20.7362.024; Sat, 9 Mar 2024
 10:20:58 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Huy Nguyen
	<huy.nguyen.wh@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, Yoshihiro
 Shimoda <yoshihiro.shimoda.uh@renesas.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?=
	<u.kleine-koenig@pengutronix.de>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH 2/4] usb: renesas_usbhs: Update usbhs pipe configuration
 for RZ/G2L family
Thread-Topic: [PATCH 2/4] usb: renesas_usbhs: Update usbhs pipe configuration
 for RZ/G2L family
Thread-Index: AQHacYPHPmeIIt5jDEetVMLhN92O5bEuPbKAgAD1JHA=
Date: Sat, 9 Mar 2024 10:20:58 +0000
Message-ID:
 <OSAPR01MB1587E3E5CA59AD57221CA0E586262@OSAPR01MB1587.jpnprd01.prod.outlook.com>
References: <20240308180919.6603-1-biju.das.jz@bp.renesas.com>
 <20240308180919.6603-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdX3VFc7Njn9Cbxu6k62S7yXX8f3Z3avF6RqhEVBPm7h3Q@mail.gmail.com>
In-Reply-To:
 <CAMuHMdX3VFc7Njn9Cbxu6k62S7yXX8f3Z3avF6RqhEVBPm7h3Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSAPR01MB1587:EE_|OS3PR01MB7127:EE_
x-ms-office365-filtering-correlation-id: b9e04dfb-5003-4f24-b418-08dc40229cea
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 52HQpIkoFo6ZIhkwmee6pkvh6iTXl+8eCU30rQcK/9XqsF7jTlOo456gQs3jsk8PnksXZSqOirRAhgvSrEqIeWOouJhUYbEGa3kk9qsrPvefqfyOGbnk+UP4rx3G18Ogifvi7FumVLJ2dTliky/u8Ozr5kJgyZp/E6NDzxQ/6LWAeJRDSqZsS1Jhe38A7JtjeeUOdeB5YDrpVpopRmW+e075/zpqjs81QnYeSgJfH3jjFXXE06aw3oZVbawBGW5vAYTd1m0kOIdxaZZnt2mrsrR/P5mouKGayhiVYunbA8uFQwyuWbc4MPwZDgEDZ6Z5P7VRL7wYWOmrQaiVpbtMZjbBte3tv/fSiEkkWpIgxiaOiV3/Sic09dISjUk2jXyDhA+98hlHtCb21v98JfP44zVMPifezuAkYvjWp5YUO+C8yNxiQh1NYpfgDcBO0to/f5iQit/zboTrhJvjF0jaoFSO0OmxEpjmmHPja8lcAA+ijF7aaTFiFUAcOC8hY2/FCj3vQc+fKcBB9MVyMYzG7LHwTTGe9pg0rN20y9ZaHBcVcj5djtYSJwUkzUnBDwyCt//WPMgF7wWta1/YGOA0uL1dca2Kkph1l++eL9sTiCMXrYpD7Bspg42mh3OCIKyLfWE+sihHfTKmc2T4uMoOSov3a0tnggZ9+Ux03mNe7XRzU2uai87YhjwVj22nEgDL3AbU5SYOh0IpiTS59pRyAC8R0IeOtC8Cj37sVD5wcfs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB1587.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(7416005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Mno1NTJ4SjRsNjdXTXhpOGdOQTJNRC9rWlhuY0oxQ29PRlBaTjJvMjF4eFZi?=
 =?utf-8?B?Z1lFOG8wZFg5K2J0M0Vub0ZkS0FWZVN6Q1dzOHJWYnBlL2l1YWNPS3QweHly?=
 =?utf-8?B?dENUS1JYM2x2QW5xM2RmcGpYcWFvMjVBN2tFZ0pWc2MzS0xrTlloclAxUkdG?=
 =?utf-8?B?UlJXdjdveFFLaVY0N3NBb0NCbFV5Wm5kaExOMzhNL1Z4YUxTRnBBUjBqT2w1?=
 =?utf-8?B?QTF4WE1pTXdDK3Q1cnZ1YmRZZEJKd2lKa3J5cW1DendleHozaUZKc2tJTTNC?=
 =?utf-8?B?QmNRa2NCV0hLOE9IMWJxN3JEUGVOWmNCSStNRVF4UnFlWWM5dk5iQk0ydVU0?=
 =?utf-8?B?QnJIZURhaWRGRFdBdEhLdDRJcGIvVVEwcFc3UU81VUF1VnppWnlPalBYeXNs?=
 =?utf-8?B?a2k5Ry96dFhmSERhYnIzSEp3bklCU0RLV1BxelByTzRxWXIxalF2VlRVK0xP?=
 =?utf-8?B?UlhYN0xiVXE2Y3lIeDZhbW9ISnF5K05xMGVjYldzL0hJcEZHdkVFeWJ4eUM4?=
 =?utf-8?B?WVZyaDdrUmE5MFBMamxwM0YxNXJRcUp2K3NHMWw0L0M2NWM5MWdsYzVYVk9Y?=
 =?utf-8?B?WmpLUks3Mk9wc3JXTG1ZVXJiMW5xMGtKNVltbFZtU0dla2tPZ1RXWHRFMkRB?=
 =?utf-8?B?QkQ1d2wvOThvSHl2QVoyeHQzVFhXU2FKaWVCaTYrdjRiakFHVjdkTGdKTTlo?=
 =?utf-8?B?K3NkamJRblQ3STFoak5RT3A2UVVYZTFxT2d4YlRTNTZmL0N6S2ZXa0VCRW4w?=
 =?utf-8?B?WCtsUi9yRGs2UHRwL3N6SW8zNU43NDZLNEtWSWdoZkhzdXVWdFBCR2thaFNp?=
 =?utf-8?B?Q045RVV0aWs4eWxTS1VsQU9kSjVJWjFtVkhnWkRVSFZZU28vd0FZZkMvWGxS?=
 =?utf-8?B?VE9xRnVTbnNHQjJkSyt3aEVveXI5cmZrdE4yczZqZk92RWI0WHJid0lTZ3Rw?=
 =?utf-8?B?TU0rbUVSSE95RHE0dTg0cnJoWEtFQ1QrTTlveEp6MUVqa3FoSUtrTTJRcDlH?=
 =?utf-8?B?TER3NDFFMWptT2FrbVJnbFpuVVN6R01WVzE4MCtWbkcwbklKZlV5V04vVU0z?=
 =?utf-8?B?NVRhTU8zdS9pTk1aTVI5d3FBeHBHMnVPQkNrSEV4Yk9YTWl5OUNYLzFOaFkv?=
 =?utf-8?B?RFlTU1NtSnhlWldQMERyQXA1aWJLZkl4aXpCejNObEROcFRpNXR1ZWxmMVoy?=
 =?utf-8?B?Vks0dzRpVzl4bjUzbEJTVFhydUtsQjFEem9iZU0ybVhVZ0pvSk1TUGdtdG1S?=
 =?utf-8?B?RXFRQUY5cU41MHBGOWQ2SVB4NER2SFRHdjJWaFQwYWNnWjg4ZXRKSUpOMHg5?=
 =?utf-8?B?djdxK2s2UkdESjRGTU92OWdwOHEwZ29jWHVPVit1eHF4eUt4RDRzMmtHVVQr?=
 =?utf-8?B?RUttOWlTUEtZcVEyMElOMFkzaFFrWmV3WmNGaU40VnJNcDFhQjhUaU1lNkhY?=
 =?utf-8?B?Q0p6SHB4VTF2RnJYZkNhdFVISS8zREkxSUQyMjlrSmdnRDY3b2pvNC9pMWND?=
 =?utf-8?B?SGdOcHhNdG5LaTkvb010a2pKUEl4eGlwT0dYcTFjanc0RnV1cnNVWm92MmtK?=
 =?utf-8?B?dFdib1J6Ly9LekxDUW5BSW9LeUYwd2x3b2VsR21CdTVQbVhtd3dPZGp2MDFJ?=
 =?utf-8?B?UHZOb050aTlNK2NSNVdaaTNZWTNZYlpVemI3ampsalJLTmZIc2VnUHBITHFk?=
 =?utf-8?B?YW5oeFROcHI4VEJVckJsZHphMVVQN3QvZHNXUjg0eGdYdGRXOHNpRUErRERG?=
 =?utf-8?B?TklIL3VId1N1T3dTREh3c0taRkhrMW0rWXJ2NmhRM2t0R3h3RVlMemljbk5S?=
 =?utf-8?B?eEVKMWsvdkRsNEFMSnc1eHNYaUxLUGRrRHQzbGZuQkFBSU9EMkxMMHpLUzlV?=
 =?utf-8?B?bENQNCtpSWFybkJGUG16enlQZ2dxMjFHN2hYYUxMNlNvK0tnUDRidzBRZDB3?=
 =?utf-8?B?K3VKemIrd1ZCdGV3L0I2dmpuUklYckxrRUV2SytiZmRQMENMa2pBVVVMTnU0?=
 =?utf-8?B?aGtoYWlHbzNDR25oZmZlUHM2VmMyVzgwUDFPV1dKYmlGV2UxTzNYclJLY2R1?=
 =?utf-8?B?Z0N0d08rMXBCODNlcnVvQS9pUjBGR2xYdmFCVEw4cW9VY1VpcHF6MitrNHNE?=
 =?utf-8?B?eVR4SjRrV0VQQlo2S2pYVzdFUjJNcjJxVEZNOUxrUHVGcHJsWXgwenJRN0xD?=
 =?utf-8?B?ckE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB1587.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9e04dfb-5003-4f24-b418-08dc40229cea
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2024 10:20:58.5286
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jWY9BVQ4n3AdT/KvxmrNHMxbbfloTV/Z3jGNbhdw6RHw1fIm2G2KyT3eMFwbFQMVfr0Gl4ldInjLJkehkdAAaVjmIHvgwq9Y7IAbG4njUzw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7127

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IEZyaWRheSwgTWFyY2ggOCwgMjAyNCA3OjQwIFBNDQo+IFRvOiBCaWp1
IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
Mi80XSB1c2I6IHJlbmVzYXNfdXNiaHM6IFVwZGF0ZSB1c2JocyBwaXBlIGNvbmZpZ3VyYXRpb24g
Zm9yIFJaL0cyTCBmYW1pbHkNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBGcmksIE1hciA4LCAy
MDI0IGF0IDc6MDnigK9QTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdy
b3RlOg0KPiA+IEZyb206IEh1eSBOZ3V5ZW4gPGh1eS5uZ3V5ZW4ud2hAcmVuZXNhcy5jb20+DQo+
ID4NCj4gPiBUaGUgUlovRzJMIGZhbWlseSBTb0NzIGhhcyAxMCBQSVBFIGJ1ZmZlcnMgY29tcGFy
ZWQgdG8gMTYgcGlwZSBidWZmZXJzDQo+ID4gb24gUlovQTJNLiBVcGRhdGUgdGhlIHBpcGUgY29u
ZmlndXJhdGlvbiBmb3IgUlovRzJMIGZhbWlseSBTb0NzLiBGb3INCj4gPiB0aGUgYmFja3dhcmQg
Y29tcGF0aWJpbGl0eSBTb0Mgc3BlY2lmaWMgY29tcGF0aWJsZSBpcyB1c2VkIGFuZCB3aWxsDQo+
ID4gcmVtb3ZlIHRoZSBzYW1lIGFmdGVyIGZldyBrZXJuZWwgcmVsZWFzZXMuDQo+ID4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBIdXkgTmd1eWVuIDxodXkubmd1eWVuLndoQHJlbmVzYXMuY29tPg0KPiA+
IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4g
DQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+ID4gLS0tIGEvZHJpdmVycy91c2IvcmVu
ZXNhc191c2Jocy9jb21tb24uYw0KPiA+ICsrKyBiL2RyaXZlcnMvdXNiL3JlbmVzYXNfdXNiaHMv
Y29tbW9uLmMNCj4gPiBAQCAtMzk3LDYgKzM5NywyMCBAQCBzdGF0aWMgc3RydWN0IHJlbmVzYXNf
dXNiaHNfZHJpdmVyX3BpcGVfY29uZmlnIHVzYmhzY19uZXdfcGlwZVtdID0gew0KPiA+ICAgICAg
ICAgUkVORVNBU19VU0JIU19QSVBFKFVTQl9FTkRQT0lOVF9YRkVSX0JVTEssIDUxMiwgMHhkOCwg
dHJ1ZSksDQo+ID4gfTsNCj4gPg0KPiA+ICsvKiBjb21tb25seSB1c2VkIG9uIFJaL0cyTCBmYW1p
bHkgKi8NCj4gPiArc3RhdGljIHN0cnVjdCByZW5lc2FzX3VzYmhzX2RyaXZlcl9waXBlX2NvbmZp
ZyB1c2Joc2NfcnpnMmxfcGlwZVtdID0gew0KPiA+ICsgICAgICAgUkVORVNBU19VU0JIU19QSVBF
KFVTQl9FTkRQT0lOVF9YRkVSX0NPTlRST0wsIDY0LCAweDAwLCBmYWxzZSksDQo+ID4gKyAgICAg
ICBSRU5FU0FTX1VTQkhTX1BJUEUoVVNCX0VORFBPSU5UX1hGRVJfSVNPQywgMTAyNCwgMHgwOCwg
dHJ1ZSksDQo+ID4gKyAgICAgICBSRU5FU0FTX1VTQkhTX1BJUEUoVVNCX0VORFBPSU5UX1hGRVJf
SVNPQywgMTAyNCwgMHgyOCwgdHJ1ZSksDQo+ID4gKyAgICAgICBSRU5FU0FTX1VTQkhTX1BJUEUo
VVNCX0VORFBPSU5UX1hGRVJfQlVMSywgNTEyLCAweDQ4LCB0cnVlKSwNCj4gPiArICAgICAgIFJF
TkVTQVNfVVNCSFNfUElQRShVU0JfRU5EUE9JTlRfWEZFUl9CVUxLLCA1MTIsIDB4NTgsIHRydWUp
LA0KPiA+ICsgICAgICAgUkVORVNBU19VU0JIU19QSVBFKFVTQl9FTkRQT0lOVF9YRkVSX0JVTEss
IDUxMiwgMHg2OCwgdHJ1ZSksDQo+ID4gKyAgICAgICBSRU5FU0FTX1VTQkhTX1BJUEUoVVNCX0VO
RFBPSU5UX1hGRVJfSU5ULCA2NCwgMHgwNCwgZmFsc2UpLA0KPiA+ICsgICAgICAgUkVORVNBU19V
U0JIU19QSVBFKFVTQl9FTkRQT0lOVF9YRkVSX0lOVCwgNjQsIDB4MDUsIGZhbHNlKSwNCj4gPiAr
ICAgICAgIFJFTkVTQVNfVVNCSFNfUElQRShVU0JfRU5EUE9JTlRfWEZFUl9JTlQsIDY0LCAweDA2
LCBmYWxzZSksDQo+ID4gKyAgICAgICBSRU5FU0FTX1VTQkhTX1BJUEUoVVNCX0VORFBPSU5UX1hG
RVJfSU5ULCA2NCwgMHgwNywgZmFsc2UpLCB9Ow0KPiA+ICsNCj4gPiAgLyoNCj4gPiAgICogICAg
ICAgICAgICAgcG93ZXIgY29udHJvbA0KPiA+ICAgKi8NCj4gPiBAQCAtNTgxLDYgKzU5NSwxMCBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCB1c2Joc19vZl9tYXRjaFtdID0gew0K
PiA+ICAgICAgICAgICAgICAgICAuY29tcGF0aWJsZSA9ICJyZW5lc2FzLHJ6YTItdXNiaHMiLA0K
PiA+ICAgICAgICAgICAgICAgICAuZGF0YSA9ICZ1c2Joc19yemEyX3BsYXRfaW5mbywNCj4gPiAg
ICAgICAgIH0sDQo+ID4gKyAgICAgICB7DQo+ID4gKyAgICAgICAgICAgICAgIC5jb21wYXRpYmxl
ID0gInJlbmVzYXMscnpnMmwtdXNiaHMiLA0KPiA+ICsgICAgICAgICAgICAgICAuZGF0YSA9ICZ1
c2Joc19yemEyX3BsYXRfaW5mbywNCj4gDQo+IElzIHVzYmhzX3J6YTJfcGxhdF9pbmZvIGNvcnJl
Y3QgZm9yIFJaL0cyTD8NCg0KT2ssIFdpbGwgdXNlIHVzYmhzX3J6ZzJsX3BsYXRfaW5mbywgZmls
bGluZyBwaXBlX2NvbmZpZ3MgYW5kIHBpcGVfc2l6ZS4NCg0KPiANCj4gPiArICAgICAgIH0sDQo+
ID4gICAgICAgICB7IH0sDQo+ID4gIH07DQo+ID4gIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIHVz
YmhzX29mX21hdGNoKTsgQEAgLTY0NSw4ICs2NjMsMTcgQEAgc3RhdGljDQo+ID4gaW50IHVzYmhz
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4NCj4gPiAgICAgICAgIC8q
IHNldCBkZWZhdWx0IHBhcmFtIGlmIHBsYXRmb3JtIGRvZXNuJ3QgaGF2ZSAqLw0KPiA+ICAgICAg
ICAgaWYgKHVzYmhzX2dldF9kcGFyYW0ocHJpdiwgaGFzX25ld19waXBlX2NvbmZpZ3MpKSB7DQo+
ID4gLSAgICAgICAgICAgICAgIHByaXYtPmRwYXJhbS5waXBlX2NvbmZpZ3MgPSB1c2Joc2NfbmV3
X3BpcGU7DQo+ID4gLSAgICAgICAgICAgICAgIHByaXYtPmRwYXJhbS5waXBlX3NpemUgPSBBUlJB
WV9TSVpFKHVzYmhzY19uZXdfcGlwZSk7DQo+ID4gKyAgICAgICAgICAgICAgIC8qIGZvciBiYWNr
d2FyZCBjb21wYXRpYmlsaXR5IGNoZWNrIHNvYyBzcGVjaWZpYyBjb21wYXRpYmxlICovDQo+ID4g
KyAgICAgICAgICAgICAgIGlmIChvZl9kZXZpY2VfaXNfY29tcGF0aWJsZShwZGV2LT5kZXYub2Zf
bm9kZSwgInJlbmVzYXMsdXNiaHMtcjlhMDdnMDQzIikgfHwNCj4gPiArICAgICAgICAgICAgICAg
ICAgIG9mX2RldmljZV9pc19jb21wYXRpYmxlKHBkZXYtPmRldi5vZl9ub2RlLCAicmVuZXNhcyx1
c2Jocy1yOWEwN2cwNDQiKSB8fA0KPiA+ICsgICAgICAgICAgICAgICAgICAgb2ZfZGV2aWNlX2lz
X2NvbXBhdGlibGUocGRldi0+ZGV2Lm9mX25vZGUsDQo+ID4gKyAicmVuZXNhcyx1c2Jocy1yOWEw
N2cwNTQiKSB8fA0KPiANCj4gUGxlYXNlIG5vIG9mX2RldmljZV9pc19jb21wYXRpYmxlKCkgY2hl
Y2tzIGluIGEgZHJpdmVyJ3MgLnByb2JlKCkgbWV0aG9kLiBKdXN0IGFkZCBlbnRyaWVzIHRvDQo+
IHVzYmhzX29mX21hdGNoW10gaW5zdGVhZC4NCg0KT2suDQo+IA0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgb2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUocGRldi0+ZGV2Lm9mX25vZGUsDQo+ID4gKyAi
cmVuZXNhcyxyemcybC11c2JocyIpKSB7DQo+IA0KPiBBaCwgdGhhdCdzIHdoZXJlIHlvdSByZWFs
bHkgaGFuZGxlIFJaL0cyTC4NCj4gUGxlYXNlIHVzZSByZW5lc2FzX3VzYmhzX3BsYXRmb3JtX2lu
Zm8gaW5zdGVhZC4NCg0KQWdyZWVkLCB3aWxsIG1vdmUgdGhlIHRhYmxlIHRvIHJ6YTIuYyBhbmQg
dXNlIGluZm8gdG8gZmlsbA0KcGlwZV9jb25maWdzIGFuZCBwaXBlX3NpemUuDQoNCkNoZWVycywN
CkJpanUNCg0KPiANCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBwcml2LT5kcGFyYW0ucGlw
ZV9jb25maWdzID0gdXNiaHNjX3J6ZzJsX3BpcGU7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgcHJpdi0+ZHBhcmFtLnBpcGVfc2l6ZSA9IEFSUkFZX1NJWkUodXNiaHNjX3J6ZzJsX3BpcGUp
Ow0KPiA+ICsgICAgICAgICAgICAgICB9IGVsc2Ugew0KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgIHByaXYtPmRwYXJhbS5waXBlX2NvbmZpZ3MgPSB1c2Joc2NfbmV3X3BpcGU7DQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgcHJpdi0+ZHBhcmFtLnBpcGVfc2l6ZSA9IEFSUkFZX1NJWkUo
dXNiaHNjX25ld19waXBlKTsNCj4gPiArICAgICAgICAgICAgICAgfQ0KPiA+ICAgICAgICAgfSBl
bHNlIGlmICghcHJpdi0+ZHBhcmFtLnBpcGVfY29uZmlncykgew0KPiA+ICAgICAgICAgICAgICAg
ICBwcml2LT5kcGFyYW0ucGlwZV9jb25maWdzID0gdXNiaHNjX2RlZmF1bHRfcGlwZTsNCj4gPiAg
ICAgICAgICAgICAgICAgcHJpdi0+ZHBhcmFtLnBpcGVfc2l6ZSA9DQo+ID4gQVJSQVlfU0laRSh1
c2Joc2NfZGVmYXVsdF9waXBlKTsNCg==

