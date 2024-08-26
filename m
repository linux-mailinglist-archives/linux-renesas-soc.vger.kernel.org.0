Return-Path: <linux-renesas-soc+bounces-8236-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C0295EDB2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 11:51:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 687981C21927
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 09:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79D2914659C;
	Mon, 26 Aug 2024 09:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LPzFAMIm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9ACE146588;
	Mon, 26 Aug 2024 09:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724665873; cv=none; b=Idb5TAP9QBTEsn99ud3mlhc/vvdhPnJf/u++nrEppiuf8arDKSpGO1+mg2fvfQlN+A5KXV5uq/azKWsRL3THCm7MG8rqjklfJnx83AuNplwmXPhx2PfPp3aMgWICOnE3a6CgOdCXmUY6SfsJekm0IcrCJ8iQ6GCVm1Bz+cipT+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724665873; c=relaxed/simple;
	bh=dB8lKtiNVV4Ez4+eUxhs+3IrvY2ArcPCcxkIfqqljek=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LwejZ04fDlMIx/YZ9jHnV7bR1ntezZL0DWnBTdVCVRze1fE6hl6oBEwBXdpYJsccG2TRKtoCCf2WyIrcbl3EjGx9BF7y28kZGQRm6w+CB2rZ3lqvXkND0mZX7V/YB9yjF1N1DtppmdUgWefHB3gtF0O3M/uwZ3ywAJvV1gOaRx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LPzFAMIm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 623AA6CA;
	Mon, 26 Aug 2024 11:50:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724665804;
	bh=dB8lKtiNVV4Ez4+eUxhs+3IrvY2ArcPCcxkIfqqljek=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LPzFAMImx29MIIWEjpz4M6kLGYoBiA557NEEWmKYU7SmRa0pLSpJN5n48PluoGTWy
	 7SJS8Kg4Awvvvq2AWlyq0kqmw9Pkd0ErWW2exEREBOKnzawn2Ec2uR7KeHaWazTKWY
	 Tb1AEcDJYcxlwXXH643F49XyPeTBKGQ6Cl+ffSF8=
Message-ID: <f5203242-fed4-43e7-8ba4-8f0749f7ade7@ideasonboard.com>
Date: Mon, 26 Aug 2024 12:51:06 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] Add support for RZ/G2UL Display Unit
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Conor Dooley <conor+dt@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "biju.das.au" <biju.das.au@gmail.com>
References: <20240822162320.5084-1-biju.das.jz@bp.renesas.com>
 <20240823131516.GD26098@pendragon.ideasonboard.com>
 <TY3PR01MB11346F4E01D1FA2688D2799F586882@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20240823150011.GO26098@pendragon.ideasonboard.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20240823150011.GO26098@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 23/08/2024 18:00, Laurent Pinchart wrote:
> Hi Biju,
> 
> On Fri, Aug 23, 2024 at 01:52:14PM +0000, Biju Das wrote:
>> On Friday, August 23, 2024 2:15 PM, Laurent Pinchart wrote:
>>> On Thu, Aug 22, 2024 at 05:23:13PM +0100, Biju Das wrote:
>>>> This patch series aims to add support for RZ/G2UL DU.
>>>>
>>>> The LCD controller is composed of Frame Compression Processor (FCPVD),
>>>> Video Signal Processor (VSPD), and Display Unit (DU).
>>>>
>>>> The output of LCDC is connected display parallel interface (DPI) and
>>>> supports a maximum resolution of WXGA along with 2 RPFs to support the
>>>> blending of two picture layers and raster operations (ROPs)
>>>>
>>>> It is similar to LCDC IP on RZ/G2L SoCs, but does not have DSI interface.
>>>>
>>>> v3->v4:
>>>>   * Restored the ports property for RZ/G2UL and described port@0 for the
>>>>     DPI interface in bindings patch.
>>>>   * Restored tags from Geert and Conor as the change is trivial
>>>>     (Replaced port 1->0 from v2).
>>>>   * Used "&" instead of "==" in rzg2l_du_start_stop() for scalability.
>>>>   * Restored port variable in struct rzg2l_du_output_routing
>>>>   * Updated rzg2l_du_encoders_init() to handle port based on hardware indices.
>>>>   * Restored ports property in du node and used port@0 for connected
>>>>     DPI interface.
>>>> v2->v3:
>>>>   * Split patch series based on subsystem from DU patch series [1].
>>>>   * Replaced ports->port property for RZ/G2UL as it supports only DPI
>>>>     and retained ports property for RZ/{G2L,V2L} as it supports both DSI
>>>>     and DPI output interface.
>>>>   * Added missing blank line before example.
>>>>   * Dropped tags from Conor and Geert as there are new changes in bindings
>>>>   * Avoided the line break in rzg2l_du_start_stop() for rstate.
>>>>   * Replaced port->du_output in  struct rzg2l_du_output_routing and
>>>>     dropped using the port number to indicate the output type in
>>>>     rzg2l_du_encoders_init().
>>>>   * Updated rzg2l_du_r9a07g043u_info and rzg2l_du_r9a07g044_info.
>>>>
>>>>   [1] https://lore.kernel.org/all/20240709135152.185042-1-biju.das.jz@bp.renesas.com/
>>>> v1->v2:
>>>>   * Updated cover letter header "DU IP->Display Unit".
>>>>   * Updated commit description related to non ABI breakage for patch#3.
>>>>   * Added Ack from Conor for binding patches.
>>>>
>>>> Biju Das (4):
>>>>    dt-bindings: display: renesas,rzg2l-du: Document RZ/G2UL DU bindings
>>>>    drm: renesas: rz-du: Add RZ/G2UL DU Support
>>>
>>> The first two patches look good to me. Do you have access to drm-misc, will you push them yourself, or
>>> do you expect a maintainer to pick them up ?
>>
>> I don’t have access to drm-misc. I expect a maintainer to pick it up(Maybe via rcar-du tree or
>> drm-misc tree), or else if it is ok, what is the procedure to get access for drm-misc tree??
> 
> You can find instructions to request drm-misc commit access at
> https://drm.pages.freedesktop.org/maintainer-tools/committer/commit-access.html
> 
> Tomi, to avoid delays, could you push the first two patches to drm-misc
> ?

I have pushed the first two patches.

  Tomi


