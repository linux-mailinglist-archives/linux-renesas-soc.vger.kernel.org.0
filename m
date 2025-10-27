Return-Path: <linux-renesas-soc+bounces-23652-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A3FC0F01B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 16:39:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CCBB18861FE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 15:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC9F330BBBF;
	Mon, 27 Oct 2025 15:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="tam5WpRc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C9A158545;
	Mon, 27 Oct 2025 15:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761579587; cv=none; b=sbw1AOaDiHSsnDhzFAaW6sLK7lOqXTuwLZoKc+L6/CQru+bggefvzDwdh1PFLx3tjSTHy2krxTSZF5lwIC/8v6X/ljT9+RJVs/WlPKe09sSuAg6Lw6uOxpsXChLgx0/dNWStPq0PwyB3PsXJ7TMmbLZubBCXu0TYldVauATH6kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761579587; c=relaxed/simple;
	bh=6/ET+471hNYv512nd52lPnng3Az3u5HXWsjlK/2SSkU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N+w3gAVAulVGdR5eE1Tbq/TOQMdtC5AcPwHbZISTXonMq6bzkucLQZ/LiqE46z3re4jF9AGbkAMeRj3oydzfIqapOq9UJmOdm/CcZJDwHUC9ADpGvHjxoPtMtuyCH2TOn4D0WttbEVzgUHKCJzX9TMUhb9iq2BBk5VNloPYbYtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=tam5WpRc; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cwHkP0p64z9ssx;
	Mon, 27 Oct 2025 16:39:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761579581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6/ET+471hNYv512nd52lPnng3Az3u5HXWsjlK/2SSkU=;
	b=tam5WpRc+zzWVZV4PbTXOzPSo3dL811nvFxYUwwU/uZDmSL/DXOsQncZ3r2ldGd0sZIYYx
	BLThdTJMrogxTkEJCimnO3hExPdrcoorOr/mSfghdXJ/FBeilKM9xzLMTzstRB4TltLD1A
	z+UNT5uK50CGJJ7bsGCARHVGRPOiULBWIP/FmBpnaJdclKOJ7ksmvqITgk3DNtyST0rcKW
	eOH0CyDJNwimw8PnQcrOSAGzlf6g0qDrLgnJw7f4wr3cVCiZPLUl+eIMTlhyssOZ6AyhUc
	2nJZRHrWOpMQ6pqApTB2D+bG2JrfC5lBcRe6KhsUDhGrchpniBFyjWJkRagZhQ==
Message-ID: <86de57c6-94e9-43b7-8e6a-d301ce73b0ba@mailbox.org>
Date: Mon, 27 Oct 2025 16:39:33 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 1/3] dt-bindings: gpu: img,powervr-rogue: Document
 GX6250 GPU in Renesas R-Car M3-W/M3-W+
To: Matt Coster <Matt.Coster@imgtec.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, Adam Ford
 <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Frank Binns <Frank.Binns@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20251022033847.471106-1-marek.vasut+renesas@mailbox.org>
 <6bc264c2-0c1c-492b-ba58-8c7609cfc565@imgtec.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <6bc264c2-0c1c-492b-ba58-8c7609cfc565@imgtec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 0afc5b27525a69b226e
X-MBO-RS-META: dd664fa9dm8z1eoh4j8a8wtz7xqgzsi8

On 10/27/25 3:08 PM, Matt Coster wrote:
> Hi Marek,

Hello Matt,

> Apologies for the delayed response, I was on holiday for the rest of
> last week – I'll apply this to drm-misc-next now.
No worries. Thank you for your help !

