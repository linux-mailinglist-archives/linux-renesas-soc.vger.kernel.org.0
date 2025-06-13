Return-Path: <linux-renesas-soc+bounces-18272-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7346CAD89DA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jun 2025 12:54:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EE4097A6AEA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jun 2025 10:53:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 970722D23B4;
	Fri, 13 Jun 2025 10:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Phzua/MZ";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="hkuf7FyK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26932C15B8
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Jun 2025 10:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749812068; cv=none; b=C9M0NMDywxsOMYGgdq3Pk993Bso1eg/ruCKhA8LLy1n+goc0js4BzqaPjFRexmVEDeZJbiYLFmGDWeX+PfrkO7Rf6OgMjVjzKBzQ3mftAsO7rzYXfbAxmQuS8tP5X8y2V7TPVNJp6Cp0i0JBrJiEPEgG1BY8QREiuiKIYfUTPpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749812068; c=relaxed/simple;
	bh=qqWAXxeIvqhIZc2zfV/PQb5obrmQV1uSPFHrEJtML68=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ay5R7PtEgaHAnn7prQrJrHuLn1fzajfF+fTVqip2tHXpSAjC/ZYeCaqtFYINLrArCDM4W2V6670FtupgZjV7766FWT+Khf1Riqh0j3mxGEHDEluuOj5g6cx9Lx0xuZ6H9X6gUOJf3SMT56fEH35MeyGJEzTgCKUX5dL8gxbUV6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Phzua/MZ; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=hkuf7FyK; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4bJbqt749Wz9st4;
	Fri, 13 Jun 2025 12:54:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1749812059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N0Kfqegru7jYVQbYJA0pKc1PaRPyLscZ8dgU88no3B0=;
	b=Phzua/MZzd8rJ5dHRZ5/pMcr25SR77Mqp+215l+ViEuUM+dSLXzi2I0LozZYIY9aVSmGmS
	EHfgiOnwaStzIOJGaALwS3+C4I2zNkQFy3lMIdNLKaoI8grl2X0P7MIqGVcKCMU0FgY2T6
	tUInNcnK0wz+4LpxhxOod7cPEwu26E6auB9bprkrw41o+jviM/NxE0m2xRrb3mTKVG9xwg
	KSxkzsWTcRD0f17Erw2G3qTJ2QDrgJ4gn2y8mcbwbVlBgF9GqXYPi0nhzO+gbnmXt2oYUm
	DnWqPqTZEuzVQDoJAvm9Mcb4dMUEgJpsbXZxzJVpZq84pF+WvT6hgwhAmg0cRg==
Message-ID: <a263d600-4f62-4d40-864c-e0b0c42f6863@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1749812057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N0Kfqegru7jYVQbYJA0pKc1PaRPyLscZ8dgU88no3B0=;
	b=hkuf7FyKnUjAMgshJqb0mYHhKGD/IPfrwSomz2gDPu+NtqJIkDnRw4I1nhTiD5Qlq/sq66
	8WNDso1NOl9fi+tYTXkw0s/QPtPMCShR3w8nZDZ/5+ySuv5xVt0IIagxDrGmh6Lmn0UMob
	Q7WndU9DeCP5oBV1Gf0sa1xowFvNVIKkKymJatPVRyR14ZWPky6SZUaOlGSDNstzCGMMkF
	oRBVAG48NrFVR+pHWPr/6bMUGTzEnYw1gCgX2PUaWIeC8hTPyqPCZniPXdQv6WZkVg1nK5
	X4/QbuJk3hiPfCHdj81Jj11HvjlaiHGeG7gfE90W8DcQnlSmm1euX6vT+Q5Tmw==
Date: Fri, 13 Jun 2025 12:54:13 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] drm/panel: ilitek-ili9881c: Use u8 for lane count
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-renesas-soc@vger.kernel.org
References: <20250611234913.161861-1-marek.vasut+renesas@mailbox.org>
 <109b5c25-f54c-4413-aa62-8e2ae621c8e6@linaro.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <109b5c25-f54c-4413-aa62-8e2ae621c8e6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: opjts94mt51m91na447nh8aotdwfk4rd
X-MBO-RS-ID: 4f504fa37568c5974bf

On 6/13/25 11:29 AM, Neil Armstrong wrote:
> On 12/06/2025 01:49, Marek Vasut wrote:
>> Use u8 to hold lane count in struct ili9881c_desc {} to avoid
>> alignment gap between default_address_mode and lanes members.
>> The ili9881c controller can only operate up to 4 DSI lanes, so
>> there is no chance this value can ever be larger than 4. No
>> functional change.
> 
> The u8 will still take at least 4 bytes and cpu will still
> do at least a 32bit memory access, so there's no point to change
> it to u8.
Assuming this layout:

   40 struct ili9881c_desc {
   41         const struct ili9881c_instr *init;
   42         const size_t init_length;
   43         const struct drm_display_mode *mode;
   44         const unsigned long mode_flags;
   45         u8 default_address_mode;
   46         u8 lanes;
   47 };

I wrote a quick test:

$ cat test.c
#include <stdio.h>
#include <stdint.h>

struct foo {
	void *a;
	size_t b;
	void *c;
	unsigned long d;

	uint8_t x;
	unsigned long y; // ~= lanes
};

struct bar {
	void *a;
	size_t b;
	void *c;
	unsigned long d;

	uint8_t x;
	uint8_t y; // ~= lanes
};

int main(void)
{
	printf("%d %d\n", sizeof(struct foo), sizeof(struct bar));
	return 0;
}

With which I get these results on x86-64:

$ gcc -o test test.c && ./test
48 40

And on x86 32bit:

$ i686-linux-gnu-gcc -o test test.c && ./test
24 20

Maybe there is some improvement ?

