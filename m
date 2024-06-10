Return-Path: <linux-renesas-soc+bounces-6004-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 510F490215C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 14:16:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9EAB6B2175B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 12:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D14B7F466;
	Mon, 10 Jun 2024 12:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ORks9IZN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2082.outbound.protection.outlook.com [40.107.113.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4677BB13
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Jun 2024 12:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718021772; cv=fail; b=bzuxkP/H9h3h8DXNBf0w48dD323T6+APoWXKif87PdKcn4wRVJkRvdBUoZ8BAzvoAHDK3rwAQDJ06Ydvrrqlh0v4S4kxXDH1oOLjWYQW8sZjr+ugyz0ue7cFEeyd9HBQGLlEbjvyS33+xfAagLLMlWKsx3dgZgeueFxV0gzHOmI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718021772; c=relaxed/simple;
	bh=eoe86BQ/yOV9Fki12rLgMEqlxVyFC+x03qEjhXM3wqg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Cky7SPAXiv100m5p3jj2jgqSFXOE1PSFBe6mzJJ0GP8VFJky7766omYjLBc2S6zL+H/rclGjgpQIfnF3JJOlKnKxsoFiZkdWM8tKlT0sdGo2bfZYDr3rGBcX5Wpvmt1w+7H5Ky5T80UK+xxnlJN+j1Rzg4EKSlZ+3qeRvcSTSGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ORks9IZN; arc=fail smtp.client-ip=40.107.113.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fz2mntvUcKIMvHFxiCwOekwsoOSbL8x+pCL+xyq0akhEdZ6duI0j2tM76fXKNSv6I8DUcvbgSMsvkMdVF2lMLc2fSIpf9OKYbQ5jw+0QNj9OYwjxflxMoNzaGOkyeslrkZypS7pHQKWCtEFacM8zYzqKwTkSwW8G5Yg3ayzIM587cCy2zAo2WHcqIxhew7JPxLzKjb5xXv2LaE0Xq/QewivggQCa3rIjH9FAg31kr3sLzrRKhCMb7/31Zx98vzWKS84KU2CGvH44+PQXmUZVCbSRLz99pErbQM4n1Op09UkJRUIowxpAEn7s11AZugvIKRvSnCv3ifuzcvK1K0JaXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eoe86BQ/yOV9Fki12rLgMEqlxVyFC+x03qEjhXM3wqg=;
 b=M8XwBJTMicM/Z1cQMq0NmEkXisMyX4r2cGrfXN4HTcAeUVbmZkIVuJLrbD8aRG+7MbSwLR7RZ//Sftiyw8gsJTp/sq65YzalIK2Cj1WQqNZ3CpRf8hCtvwu3If1DWF0ZQ//WNrCca3gE0KF6Vauc1gizxNnoSXvP35gniwjbXSSJKD43IM/jZcmPBvYkbYqKZwJBLossJOOPEVZKOiLQZrE3SRpzXh/D++gyIV6a6PnJ1orCAPE4F568LH7jYdyoJUZcAcZSCHIe+2bOBBdtqs58fhzBQ8JbnDwaSvtiuENkbSd0yP+MpFeLAy98UYZrGNyePRi/40JqQ6J6YTWbMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eoe86BQ/yOV9Fki12rLgMEqlxVyFC+x03qEjhXM3wqg=;
 b=ORks9IZN+TRctTKzwRloP9uSXhg/+BNDb4fhzZwFXQmg3i2xnKgXu6Son37adzebmxTLOkeL8rYCsvBVI4yoJenWlL5llRnoWCZo5BNSPsA1BjqVnX2O00Q3D7AmfMz45IN92gVf4aYqelmY18qPdE1fgnarp2bpn8/LR36VuCE=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB8361.jpnprd01.prod.outlook.com (2603:1096:400:162::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 12:16:06 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.7633.036; Mon, 10 Jun 2024
 12:16:06 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] reset: rzg2l-usbphy-ctrl: Move reset_deassert after
 devm_*()
Thread-Topic: [PATCH] reset: rzg2l-usbphy-ctrl: Move reset_deassert after
 devm_*()
Thread-Index: AQHauqnpXCwe8/8aYkunXBQS5b5EkrHA3LWAgAAHQACAAASsgIAAARvA
Date: Mon, 10 Jun 2024 12:16:06 +0000
Message-ID:
 <TY3PR01MB113465CF8F80E78ABDBDF31D686C62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240609201622.87166-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdW-UCbiz6bEZmSVHy67PA_z0p7v4U=ROSpva7nZ+YqPsA@mail.gmail.com>
 <TY3PR01MB113467988BA719B39A6B1749486C62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdX-FvmjZFphXhGe39qArRA8FwSVnFkV8ri6z-XjStG-tw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdX-FvmjZFphXhGe39qArRA8FwSVnFkV8ri6z-XjStG-tw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB8361:EE_
x-ms-office365-filtering-correlation-id: 21f78232-2dee-4489-3c0e-08dc89471ac9
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info:
 =?utf-8?B?aUxmOFZlUTFiWG0rb2ZiaUtwcWNjWEZLUEhVWktsclZ6YmZiS3B0OVpTdXlS?=
 =?utf-8?B?VXcwQXhTbDZHOTl5T1ZIWVlYTFFLM01zL1dXOWxOdlFGeFN5RXRHbzJBSS9W?=
 =?utf-8?B?bU1VNk9ZaGM0NnYvZnNKVjdvQWZEMjEvdjVjMGFNeU1FQVVGc3NiSHduc1NK?=
 =?utf-8?B?NHVvdjN4MXI0TFRUdnZQeEE2U0k1OG4rNk01RFFURTlSc0twdms4OTY1T01B?=
 =?utf-8?B?U2VnTys5TEFlTzhzTFFDZDNURE1JV0pWUTBvWGl2QXJvZDdDR01LRjRjNmRS?=
 =?utf-8?B?RTlFa0hjWHdDMy9NeElUMWFrNUxacmFEWDVsa3lNZTlSdTJrUlh4Qmx6bzIv?=
 =?utf-8?B?R08xOXVCbUZBeHBEUmFIZnE0N05CeWwyUkRSdXJoeU5RRVRmU2kyRWI4MnBr?=
 =?utf-8?B?L3NqWVBvUjhnakRmd0RGZ1paMDl5SnExNG1FdGZVQWZ4bmNjTXlTaFVZOU1t?=
 =?utf-8?B?RVg5eGFvb1dQNWZHUW5RMHJlODJDZ1F6VXBFMUE5Smc3cU9kdHo3QTdRN2Ja?=
 =?utf-8?B?bkRMcE5EbEJ4TUJIMFFPdG9LNU1rQ0lhT2xNdkQxdlZGOHVnV0hIa243Wi90?=
 =?utf-8?B?VWNWNTRzMTNRZTJyWFVTcGs3RWJUc2pQZHpBeUFwVnZOUDZBYWZIT2R6Zm9u?=
 =?utf-8?B?RUhzY1JseWIzWENPTEUzVmkxY2ZnelZYbkI5YnlYeE1VNkJ2Y3BIQmNsUUt5?=
 =?utf-8?B?b0tmcWdYZklBNzNzYUpRUWY2dnNZMm1VT01FZjVjL1lpOUtZZEY2MGxyQm5N?=
 =?utf-8?B?amdEYU1rc3ltSDB4Z2VrNTdnc282YnRQclNtM0ZRcVZFelczbGhzWjIrK3Mv?=
 =?utf-8?B?TDNHbndXMmFOZTJCcURXWWJ0N051UWNzVGM5NW1lQmYvZm9MYmhrQ0dpRkxK?=
 =?utf-8?B?MlFZdklROWR0QkVVaE9ZV3lOc2FpZFkwRGExTDQrN2YzTVJaVW1uWTBIVmNW?=
 =?utf-8?B?eFU2V2JGYmFJUTJvdnFQTkVFTVExSHNUQ2EzSjRQUndZQ280L3czVDJmS2V4?=
 =?utf-8?B?S2huRkk3UnNQbkpGMGF2MTdCeFhkdVQva3dqRUZGU1lnaDAzSW5rY1RnZ1lV?=
 =?utf-8?B?RTR5elFucWVzR0Q4ODU0akRJU2w2bnN3aldGVkF0ZXFTSC9VK2E1aVlTaEJq?=
 =?utf-8?B?cjBjWk9MUnA1Q2E1Z1IweDVqaFR3SjJpV2g5OUdBZUsrU0NBYy9pTHh0dGQv?=
 =?utf-8?B?eHVDa2IwclBDZVdrdFVISUdCRjhpS0s5NG5sNDZQSzBSOXdHWG0zZjJ6Y01P?=
 =?utf-8?B?MUd6L2NDQ0ZmVlA3UHVGc1kzMFdlMk5TMVM0amEzME5iRGFkUUFQUVRyQWpG?=
 =?utf-8?B?aGhnN0lnSDZML05nd2dIRmlZOGkxczhidE5ZRVVLVHlzYTJKYW8xRGZ2R2I2?=
 =?utf-8?B?UTQyVC9rVGJmcmdLODBoamFRd3NUOGtZM2xzeFZiaS9iNHNxZDFWMHRhUDg3?=
 =?utf-8?B?TUY3VFhmSzlBYktoT1ZIYnlyeklqOUc4aXNiT2xESGZ2eHBrVXh3RzNOcGQ5?=
 =?utf-8?B?Qm5VNmZXNklQN0lVZFh3YXNYbGhFeUdCeGtZbThzbGVFMFZBYWlsMHprRFk5?=
 =?utf-8?B?MTNFaEFVZHRqT1MxVnAxcUp2U2liUEdZYlJLVlRMZ1R4TFFvdlQvNGRwWi9Y?=
 =?utf-8?B?Y2lDc2w0T2tHRVB0Sml4d0xEemxFbFNGMHVTVW1rdXdNaklDVWwyZmNaQ2Q3?=
 =?utf-8?B?WlRmYVhqK1BEN2NmdHFNL1Bjb1BCUlNuT1JUaXE2cGFwVkJxQzNsaG9GQ0JU?=
 =?utf-8?B?TGc4SzBPa2hlTUZXQTRLdUo3MVgwNUVyNjViZ2FDMmIxeDg1RVVVbDBNTHNJ?=
 =?utf-8?Q?3Fg4tSCKKMc2+F0m1igPaK24XtVtXoTY2ZZ9w=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Ly9sZnI3UTlWTjRTNmc5VTllYVBQVWRoVFFOYUEyNUtOeVgrOUVOSGQrVy9n?=
 =?utf-8?B?ZWhRaW9sS2VCU1lma0VaWGM1RDBZaS9PNjdna0xuMGowYWJBUmRVeUN4YXU0?=
 =?utf-8?B?TmtKRjAxZVMwZTVYelUwbkc5MUlPTDR3VjNPYUpxclRUTVZCVmFvVUVaS2lQ?=
 =?utf-8?B?MXdNR3lKMjEraHlDNHdqYVZmV1UxTkdKNktJZTIycHlseTIvNGFwNEk5cURO?=
 =?utf-8?B?Y3VCRUlMNWkxSW5nNHBIeWlPcStQMWt6alFkci8vNzM1aHE3dEtLZHh1THRr?=
 =?utf-8?B?eFovZ0srSWZ3eHJmeE84ampEMDlZL0p2d1JDSzNPK0ZuV2ZyMzZrRTdYWGR4?=
 =?utf-8?B?Y2JMS1YvN3F0QTVyWVA0WkFnTS9iSEtiamNyU2RUTXByN3RHZ0YzRUF6eWYx?=
 =?utf-8?B?NEN5SU5NR3BlTEIwbkd5VUxWdFRaOUdmYy9MNlI1em8wcWVvOWhxWUR0UDBn?=
 =?utf-8?B?TzI5MGxTMERjaldVenEyQ3BlbWgvSUlyaWNka1NwS0NzSXU3WktjVkt6TklY?=
 =?utf-8?B?a2RYd3dTZk8ySlBXblR1Rmd0UVdMcFNLYVhKMjlucXdJRktqSmhvcGoxSWxE?=
 =?utf-8?B?KzNaN0EyV0ZrYkYvT2drd2JiWGp0d2R1UUkvOFFrVXN5V1dYU0ZqWHRlOFhq?=
 =?utf-8?B?ZmFxVHFYdnErMXRYaDg0MU5aMWx6UnZoMG52dTVWL0FGaGZzdDhSR043eGRU?=
 =?utf-8?B?L1gzbXFVYjJIYlRIamxJY29RQUh5N2dqMmRRbmxsOVczMkpSUXBxdngwN0lo?=
 =?utf-8?B?dkg2L3ZxTU5lYmFlYlZzNWdtQ1RBMEdxaUdWZnhDSkQrRWlCRDNEYWJUUHFL?=
 =?utf-8?B?Sk1FLy9NbGg4U0R2NjIvQWF5bGtFYmRDYUlJbHhGSG5oOWNmZ25rOEZHWGF0?=
 =?utf-8?B?QTJQUzMzUmJTcFRyWmEybVNvYnRrdENzdjBGQysxTm56aG1nWDYvT1UyMHZv?=
 =?utf-8?B?V2VXK1dXR3JUeStoaGZXMTBEV1BJRUNSbGp4eTd3K21SYlNyU0R4clExcVli?=
 =?utf-8?B?ZDd2YW5oVm4wbjFkVGE5N0hOWFo2Qy8yYnZlMVpER1BRcEdxUDZDU28zZmJV?=
 =?utf-8?B?eTQvZTYrV0VwYmxMaXZGTXBBc3pTRU1ESTlNYWxLempFNkdHR2oxcEYxOWRM?=
 =?utf-8?B?R2JwcGpKa0EvTWhIa09NN3R5eTNibmNKWFpTYXFxQ2FUVEEyODJoZFZUR0Zr?=
 =?utf-8?B?aVJocU5IQUhBc0FrWEFnMWVSQ0IyYTdRWHJzcGttYkVUdjJic0JURHF1V0k0?=
 =?utf-8?B?WmJBOUtiaUVGeXJ6SCtrK2hoaGhXeHRnYjVQajNLT3NCQytaM0NuV3E5RVIr?=
 =?utf-8?B?a28yeEp2M3hGQTczaldyUTN0KzNyNjRsQXdGNTRTY3RCZzV2NVJJQlgwWDZF?=
 =?utf-8?B?ZU54eXZETlZmYmhES2FxWUUzMHJ0WU9SN3hCZzRJTGl2eGVpaEtDd3RPS1FY?=
 =?utf-8?B?SlVJaVpRU00wQWs4aHk1NEV5WHh3dHNtUVRQbU5BSnR0YVg3Z1dSTTJ3SXAx?=
 =?utf-8?B?RnZkRGdSVEkwUk5KM3BuZUMxVEJaZUVpdGpCVkxSSlAwc0x1M21xR3hGdjVU?=
 =?utf-8?B?bndIdkFFemxHUjhhTkhCSUwzOVhxL2FlMFFoeExUYVRwMzBaU1hRV0J2bTZ4?=
 =?utf-8?B?emlXM0dva29zSmFiOHpXelp0RjNzN3dIbGJGUzUrd1lrN0h6eTU1c3lHT3RF?=
 =?utf-8?B?TFVrTDB3TnJsS1FhOG0wKzM1WFI1SUU0MXNVcHdWdENYTXpEZHMrK3NuUXFz?=
 =?utf-8?B?NGY3eUI5RlpIZkZEY2pqNlQ1K3owVWFzaGJndTB4VTI1UHhYUTJFU3Azc2sr?=
 =?utf-8?B?d3U0WWNBc2gyMWk4VUhQMUtOWjY3R1BvdFYvRWpiSnNxNFNWTmFKUEkvd3Np?=
 =?utf-8?B?dk1GTkI0b2JRaVZidXZsMFJzelpVSFNucUdDb0psemYvL3dMbldRcEZFUXFT?=
 =?utf-8?B?MHdkbjBsSU1MdSs3UDZkU0FDQktQcHA3ei9ZSmg3K2oyMUhtNy9qLzhQckRt?=
 =?utf-8?B?b0YvdG1MYW41WW01NVNtRUFpQjR3b2t1dHFpTjVWNW5ybHN3aXNORi96Z2Rn?=
 =?utf-8?B?UmErd2Y4SzV2R3RuTnhlYWRjQzhHekI5b1pzMUN0RndBTjl0bTh6ajJueEpB?=
 =?utf-8?B?Z3JMTDA3WElOY3RDTXhBcVJsUld3WDVKZXVBQVBRTEVWUzMyM0YyQmpwVXJF?=
 =?utf-8?B?QVE9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21f78232-2dee-4489-3c0e-08dc89471ac9
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2024 12:16:06.4472
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KZ0IYVzdTGhN2qgt9B4Kf7t0CDaJPqn3UORPp6d+2NcXP+zb1g+F/J7Eos8KMpjytp9iraqsp+e29lNuTj2rha8Dh+HrhyOuVxN2wfkumrA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8361

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogTW9uZGF5LCBKdW5l
IDEwLCAyMDI0IDE6MDkgUE0NCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gcmVzZXQ6IHJ6ZzJsLXVz
YnBoeS1jdHJsOiBNb3ZlIHJlc2V0X2RlYXNzZXJ0IGFmdGVyIGRldm1fKigpDQo+IA0KPiBIaSBC
aWp1LA0KPiANCj4gT24gTW9uLCBKdW4gMTAsIDIwMjQgYXQgMjowMOKAr1BNIEJpanUgRGFzIDxi
aWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gQWxzbywgSSBhbSBwbGFubmlu
ZyB0byByZXBsYWNlIHBtX3J1bnRpbWVfZW5hYmxlKCksDQo+ID4gcG1fcnVudGltZV9yZXN1bWVf
YW5kX2dldCgpIHdpdGggZGV2bV9jbGtfZW5hYmxlZCgpIHRvIHNpbXBsaWZ5IHRoZSBwcm9iZSgp
L3JlbW92ZSgpIGFzIHNlcGFyYXRlDQo+IHBhdGNoLg0KPiA+IEkgZ3Vlc3MgaXQgaXMgb2sgdG8g
eW91Pz8NCj4gDQo+IEkgZG9uJ3QgdGhpbmsgdGhhdCBpcyBhIGdvb2QgaWRlYSwgYXMgaXQgd2ls
bCBjYXVzZSBicmVha2FnZSB3aGVuIGV4dGVuZGluZyBQTSBEb21haW4gc3VwcG9ydCBvbg0KPiBS
Wi9HMkwgKGFuZCBSWi9HM1M/KS4NCg0KT0ssIEkgaGF2ZW7igJl0IHRob3VnaHQgYWJvdXQgZXh0
ZW5kaW5nIFBNIERvbWFpbiBzdXBwb3J0IGZvciBSWi9HMkwuDQoNCj4gQlRXLCBkZXZtX3BtX3J1
bnRpbWVfZW5hYmxlKCkgZG9lcyBleGlzdCwNCk9LLg0KDQo+IGRldm1fcG1fcnVudGltZV9yZXN1
bWVfYW5kX2dldCgpIGRvZXNuJ3QgeWV0Lg0KDQpUaGVuIGluIHRoYXQgY2FzZSBJIHdpbGwgbGVh
dmUgbGlrZSBhcyBpdCBpcy4NCg0KQ2hlZXJzLA0KQmlqdQ0K

