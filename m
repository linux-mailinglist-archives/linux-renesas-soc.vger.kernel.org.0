Return-Path: <linux-renesas-soc+bounces-24118-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E41C34997
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 05 Nov 2025 09:54:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E461F18C8F10
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Nov 2025 08:52:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED72D2DC77A;
	Wed,  5 Nov 2025 08:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oTAj8Sd+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5ED22DC346;
	Wed,  5 Nov 2025 08:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762332666; cv=none; b=s4yopiCjOl8/KkakPxo7ousiPASCWVnMmCNhDcZX0I+uzNIm4jP7yBzvczoBmVfQeCV8mCKNBy9eoVYrsnLWjA6IHE6Z5yZt3wfZZM/9hYIc7l/67/YVt/jYaiDo7JUMagzPHruohRjiwqKbcKOWfrDxsY+VZDIyTAb8TDu+H0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762332666; c=relaxed/simple;
	bh=bqAeZIBrgDEYsoUKavOSuZR1RUcIXXU179muk25cQ8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JWQ68+W2wPVeSioAV8sOJBVR1uEpwFHSuDsqsyGK7aOqCHdwGdZ/+58pCWUSLeGh4/p7IC601VpH5EheLYP9/FH44/ov8HVSObDAVy7/3fiptW4CXgupsBZYTgCv7UHjYTHjoVsvbS3x4QnlbOx5e8pJMHG0P/6UDS1ARFXYeG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oTAj8Sd+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2245CC116B1;
	Wed,  5 Nov 2025 08:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762332666;
	bh=bqAeZIBrgDEYsoUKavOSuZR1RUcIXXU179muk25cQ8o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oTAj8Sd+o5/noh9v7+A1raHbMoeBVWhksX+j/sOANpEjwXXNmjkcAaEOYSlUnQAn1
	 nQ1/vHYYeYmU47XRl9IjnoGnH351Ly1OsR/MaNHnK9V1VxyKFON1gN4iz77h5hkg5p
	 n0Se9zuxuAXAkJBP1/Qy1QqI9R6hrPa4pEMOSqMAFLNnZ5QmlCxVQ5ZiqbTIfP+fiq
	 i4U2wZuqQsu/fPzsngCeDq9XGoelwp78rHpuMmB1uheuV8+n9IwlyWlRwXE77D/qMy
	 d/nDTA9bUkWsaiXRL1sOqAf0daUWd6h6Q1WQNLGl+MshSK1s6icSY5ChD/2SrMl4B4
	 LPIEtizFPyiDg==
Date: Wed, 5 Nov 2025 09:51:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
	Frank Binns <frank.binns@imgtec.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Matt Coster <matt.coster@imgtec.com>, 
	Maxime Ripard <mripard@kernel.org>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: gpu: img,powervr-rogue: Keep lists
 sorted alphabetically
Message-ID: <20251105-robust-aquamarine-tench-c71fd3@kuoka>
References: <20251104135716.12497-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251104135716.12497-1-marek.vasut+renesas@mailbox.org>

On Tue, Nov 04, 2025 at 02:56:05PM +0100, Marek Vasut wrote:
> Sort the enum: list alphabetically. No functional change.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


