Return-Path: <linux-renesas-soc+bounces-34098-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aDFiLSePMWrSmgUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34098-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2026 20:00:07 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B74693B64
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2026 20:00:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ragnatech.se header.s=fm3 header.b=2brQOGfK;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b=FUAUFrRd;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34098-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34098-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ragnatech.se;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3681C3088139
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2026 17:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60B8447A0C4;
	Tue, 16 Jun 2026 17:59:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25BE356766;
	Tue, 16 Jun 2026 17:59:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781632793; cv=none; b=USE/AwJdCHeZeJiSj8Bz5RdNj7N6vqJ10HEOGOtufR64kP1fv/24LXmRwdh8Dy5ap2iCuJHW32qTam24N23Rske1WphQ/OTH0KKhrM9MlI/Nb3HFAKrfPrIRkYd4x8jVUXifPxf1ScgoFFgHnGODlLCmiWOFQY0mwN5f8wKFZbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781632793; c=relaxed/simple;
	bh=oDAJ6BkBLht2O3ozAZLw/7x6RyjFOVByMdZ86HloKGg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ubUGvkh1ggcBV32E6BG+2LsxukFJZYjvTSpqGc3vkHPdv/PrmvgpgJAQtCsPvg8EOUI9ZNQ9nsWHQJ601kMBs6dQiRTbClbNZ/wBIauYbkEmjDBxz3XvtrEbgPuq2G1nHiE6Brl2a8oHVVZ5hIsMQivE/CpGU13iztDj5k/IUOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=2brQOGfK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FUAUFrRd; arc=none smtp.client-ip=202.12.124.149
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 927631D00047;
	Tue, 16 Jun 2026 13:59:50 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Tue, 16 Jun 2026 13:59:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1781632790; x=1781719190; bh=2K
	HqdAQvS6LYGq9BigDCPJUQFQ0+SZhsyyRYGHPKzOs=; b=2brQOGfKVLiD3sGEhd
	vKnJ4l7KqAvkKyO3MOFb2QXZ8xk0QVFLlEm+fDhOs7LbTXwGxxQ5DG9zraFAjcxA
	JJA6nUOf7tT1XO2spcUAuHkFXMmLlPe4LCZSrGHuj7uyM3CjPF5eZkffNQcvvUKY
	ZVWAmFwj8hwmFD6CHyXTGPO8prfx4MErwI+SqFpLHm3r1d2QLQ6ePIgWIUjoN14U
	T84Y9+LBNsCqrFYeEftqj+UpjPpu8kq7B0bDs1yUXqYh3pOqimuzguPniTMd9WUe
	HfXGiLTT3xK92CYLamkOipbazg6OUn5HSianHvGhmIbgPcCiXy/9yOJYmLqvPhLr
	WMhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1781632790; x=1781719190; bh=2KHqdAQvS6LYGq9BigDCPJUQFQ0+
	SZhsyyRYGHPKzOs=; b=FUAUFrRdw0df3ehoPtkWKF3HsqJMu6wO5Gx7zU2Ozm66
	0ppiJ74MUkz3xb1W23EfkUwop55cikaZCcsNNSGiSWQCrEX1Q36Flie77+cdAxEL
	nb995MqFHIr9hOT1WK6gcpqGv7pHg7VnrqjbloyA3sDBeRszi8Lai6pPkFotQb2G
	8QfHDI6nICXndz2jG1rSk+JNt9+8155etn8gydpsonMwTXFxuce5VUnqd0/+Xa/c
	lUOyJ7keoFfvaD6YEwIuLcDmuEavUTfbuTLVD9oDPhJuNbLqCLYWwbTuaAEEC/xQ
	1gDB4hAf8zljg6mCn1u5a278zx1JHrUdISOeByAOZQ==
X-ME-Sender: <xms:FY8xasdjQFturD8kGbWS1alJ_Xgjm3B1BOMNf527q-aeHoKJjNCaag>
    <xme:FY8xaqgPBe9amh7xJaz8bqCWAYsnVKsL5sasgCpXh5loN2TuFRheVv_XPZA2PmluI
    RFVcCwfHuMdsSyyRBvjYXEzIQOmlQZdtiUsrjm7suRHX-_O2ivTyg>
X-ME-Received: <xmr:FY8xavI8Dipt10N9OtJ5Ci-1ZNX_CnBXkDV1blQy7WRgW7l7F85vbTS1AXMAnkU5ytM0QjMh6l0WDV53uMwCq7_xtVIa>
X-ME-Proxy-Cause: dmFkZTFZzyQWraOnST6FuDBlHu3xHOEH2q3xdoju3GmHJ9O+ktDvIl7h/6KkwZA+sIw1K6
    tX+BvuEZo0yWeRvKtd1fUdkREWavinalVe9+ePjYvGL63Fz0KKTVFBCe47T8ru2qH5Uf74
    AEfJmsTCJS66cT/v46iyiovOmg/KjHn9wwBXq07BGa0ITIClrTYrDXVni51h3b4GYiLAtC
    wxaAZ/b0hHorrpP51lEQfpyd6FjzzYAyJRTm5wr2syUFR6Nyesl4p2mFxDz/+9BEgh0IID
    WOCd96YyJmBe3X4nW265gJBJpVvOjYom2yIcMhTBEPOtSnK26tM0F/TUJsIn7gO7BUBBTe
    TtA64UEAmph0guL9fnWq2kxZ1Z+OoOSegkGWd21PFa7RG7iXF1k6OmD+YQR9Tv5mCcZEre
    NTZk7GmvvkSNmQuUtrqt0Vy0A76O9E0DyuSra0TTtMeYqUUy7S9E3TcbE6ToEGk9v2Sq2f
    DkdO3HQiRwtSl7vhmrMrVgiV3Tt/yuw7bhYogqjsJJ7AoTQ0NbQfd7vfe6JzqYkGqhEXfb
    TyTJ4m2AhndT36/nLgwLR786nMoY1wIiQWglXjEY3geXQFM/SmfAeoFiKnAU6gKyoyonL2
    uNnINl4DrEJQF8xkI699Pev2P7LQw8m6rTuBaw4td6cELSlvNWy17WcAxPhg
X-ME-Proxy: <xmx:FY8xavEdLgccP0tQo3c23--KblonfH0GspMq_4om0I2hsdR8bql09Q>
    <xmx:FY8xat3hltiaP0yBysvLR7qoFZIVtVMnpRU3YC0h71C9JAB-1tckAw>
    <xmx:FY8xauyRjMfCk5Dwqm_0VJmX__YltLM2Q1siPLp7_2CRWLEnQkOJkw>
    <xmx:FY8xakjcQ3xj4ENwTFO1XrYuHjpEr7JuPdNq9lDP0Pec04q1lvlDGw>
    <xmx:Fo8xaroGMPGGJwMBuDMcsNBcm9L_KEqDsS6G_bWOrXTp6YwXPnbTMv4Q>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Jun 2026 13:59:49 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 0/2] arm64: dts: renesas: Describe GPU on D3
Date: Tue, 16 Jun 2026 19:58:33 +0200
Message-ID: <20260616175835.2109336-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm3,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34098-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[mailbox.org,glider.be,kernel.org,gmail.com,imgtec.com,linux.intel.com,ffwll.ch,suse.de,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:marek.vasut+renesas@mailbox.org,m:geert+renesas@glider.be,m:conor+dt@kernel.org,m:airlied@gmail.com,m:frank.binns@imgtec.com,m:krzk+dt@kernel.org,m:maarten.lankhorst@linux.intel.com,m:magnus.damm@gmail.com,m:matt.coster@imgtec.com,m:mripard@kernel.org,m:robh@kernel.org,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:devicetree@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-renesas-soc@vger.kernel.org,m:niklas.soderlund+renesas@ragnatech.se,m:marek.vasut@mailbox.org,m:geert@glider.be,m:conor@kernel.org,m:krzk@kernel.org,m:magnusdamm@gmail.com,m:niklas.soderlund@ragnatech.se,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,gitlab.freedesktop.org:url,messagingengine.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ragnatech.se:dkim,ragnatech.se:mid,ragnatech.se:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 59B74693B64

Hello,

This series adds the needed bindings to operate the PowerVR GPU on R-Car
D3 SoC.

Together with the D3 clock changes [1] and a still OOT patch for the PVR
driver [2], I'm able to load firmware.

    powervr fd000000.gpu: [drm] loaded firmware powervr/rogue_22.67.54.30_v1.fw
    powervr fd000000.gpu: [drm] FW version v1.0 (build 6889268 OS)
    powervr fd000000.gpu: [drm] Unsupported quirks in firmware image
    powervr fd000000.gpu: [drm] Unsupported enhancements in firmware image
    powervr fd000000.gpu: [drm] Unsupported features in firmware image
    [drm] Initialized powervr 1.0.0 for fd000000.gpu on minor 1

I can run vulkaninfo from mesa (need to add the driver to
pvr_drm_configs):

    $ PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=1 meson devenv -C builddir vulkaninfo --summary
    WARNING: powervr is not a conformant Vulkan implementation, testing use only.
    MESA: warning: Warning: The available RAM is below the minimum required by the Vulkan specification!
    MESA: warning: ../src/imagination/vulkan/pvr_border.c:117: FINISHME: Devices without tpu_border_colour_enhanced require entries for compressed formats to be stored in the table pre-compressed.
    ==========
    VULKANINFO
    ==========

    Vulkan Instance Version: 1.4.335


    Instance Extensions: count = 20
    -------------------------------
    VK_EXT_debug_report                    : extension revision 10
    VK_EXT_debug_utils                     : extension revision 2
    VK_EXT_headless_surface                : extension revision 1
    VK_EXT_surface_maintenance1            : extension revision 1
    VK_EXT_swapchain_colorspace            : extension revision 5
    VK_KHR_device_group_creation           : extension revision 1
    VK_KHR_display                         : extension revision 23
    VK_KHR_external_fence_capabilities     : extension revision 1
    VK_KHR_external_memory_capabilities    : extension revision 1
    VK_KHR_external_semaphore_capabilities : extension revision 1
    VK_KHR_get_display_properties2         : extension revision 1
    VK_KHR_get_physical_device_properties2 : extension revision 2
    VK_KHR_get_surface_capabilities2       : extension revision 1
    VK_KHR_portability_enumeration         : extension revision 1
    VK_KHR_surface                         : extension revision 25
    VK_KHR_surface_protected_capabilities  : extension revision 1
    VK_KHR_wayland_surface                 : extension revision 6
    VK_KHR_xcb_surface                     : extension revision 6
    VK_KHR_xlib_surface                    : extension revision 6
    VK_LUNARG_direct_driver_loading        : extension revision 1

    Instance Layers:
    ----------------

    Devices:
    ========
    GPU0:
	    apiVersion         = 1.2.330
	    driverVersion      = 25.99.99
	    vendorID           = 0x1010
	    deviceID           = 0x22054030
	    deviceType         = PHYSICAL_DEVICE_TYPE_INTEGRATED_GPU
	    deviceName         = PowerVR Rogue GE8300
	    driverID           = DRIVER_ID_IMAGINATION_OPEN_SOURCE_MESA
	    driverName         = Imagination open-source Mesa driver
	    driverInfo         = Mesa 26.0.0-devel (git-8fb0621f2d)
	    conformanceVersion = 1.3.8.4
	    deviceUUID         = 19031a08-e22f-9565-d78b-ddda8240380a
	    driverUUID         = 48685174-7bd0-6840-5716-9d00003566aa
    GPU1:
	    apiVersion         = 1.4.330
	    driverVersion      = 25.99.99
	    vendorID           = 0x10005
	    deviceID           = 0x0000
	    deviceType         = PHYSICAL_DEVICE_TYPE_CPU
	    deviceName         = llvmpipe (LLVM 21.1.4, 128 bits)
	    driverID           = DRIVER_ID_MESA_LLVMPIPE
	    driverName         = llvmpipe
	    driverInfo         = Mesa 26.0.0-devel (git-8fb0621f2d) (LLVM 21.1.4)
	    conformanceVersion = 1.3.1.1
	    deviceUUID         = 6d657361-3236-2e30-2e30-2d6465766500
	    driverUUID         = 6c6c766d-7069-7065-5555-494400000000

I can't run test Vulkan applications such as gears as the PVR driver do
not support all features need for GE8300, for example
simple_internal_parameter_format_v1, see [3].

1. https://lore.kernel.org/linux-renesas-soc/20260616175247.2104891-1-niklas.soderlund+renesas@ragnatech.se
2. https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/38211#note_3177232
3. https://gitlab.freedesktop.org/imagination/mesa/-/issues/13

Niklas Söderlund (2):
  dt-bindings: gpu: img,powervr-rogue: Document GE8300 GPU in Renesas
    R-Car D3
  arm64: dts: renesas: r8a77995: Add GE8300 GPU node

 .../bindings/gpu/img,powervr-rogue.yaml           | 14 ++++++++++----
 arch/arm64/boot/dts/renesas/r8a77995.dtsi         | 15 +++++++++++++++
 2 files changed, 25 insertions(+), 4 deletions(-)

-- 
2.54.0


