Return-Path: <linux-renesas-soc+bounces-16470-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61919AA0FDB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Apr 2025 17:01:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C52D5165823
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Apr 2025 15:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BCAA21C9F2;
	Tue, 29 Apr 2025 15:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HWmNAI5O"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58021218ABA;
	Tue, 29 Apr 2025 15:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745938877; cv=none; b=lKYhsxMk9sO4j/kj+gifocV1QBPVpNnX5tzaBQ6Kjf0dNqaWVWcSiSJgO1AivQCWQEEQ1n2r9MW5kRZPXoQfDyn/7OLBc5nfjp/cTVcXaDTIoRizYn0fQU3JEr5iOXLbuvfyaIZUFxjxTKdNHotCDqIoddTPMU+KbQlHYMnXqE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745938877; c=relaxed/simple;
	bh=UQgYl5cvjAaC6YHzBjmSn9qYkSS2URKtp0ZQVUPviMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=osZMfMn/KoGUKQKBwhY9vrzXLQ7cDXdYEk29ikQ5HF/Uiq3HPMW1vU6HtYVZHlCKdyymfTythWYzBArJ5NlQ9nEC9jGi6GE2NH6feypHq/UduK7cvHWarUJQjl0HgKNYAlXfe8TFACGUZKCtt0hnTsq0z/vJZsi3eylur65gPjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HWmNAI5O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97708C4CEE3;
	Tue, 29 Apr 2025 15:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745938873;
	bh=UQgYl5cvjAaC6YHzBjmSn9qYkSS2URKtp0ZQVUPviMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HWmNAI5OB6WUpsYfsKvOROAHHmYuKknITMBLDaWInxVaO1r7PYChRH3VQoVWV0Rh6
	 niRJkgtLhOB85gnZMPaGZAJ8C95JhyTk7c68DFyYxbde2/xaA8SVXuNNLltec5rUJU
	 DjfSzjmAOmotxP4H0rj3k4NrypcD7JXTXnWMy8wc2YcQsFLD46tbcCClA48RZI1Ry3
	 XZA9d2pNtkXBnJBAmcHHaStFNLEcNvaePY9v1UWfQJDwpA2yO8COL2aGHBzLuV+oDd
	 abgsx0iNsCwDyjU9+zTg8n3KkmChEq1cDMI0YoeOErFGIUwCMpUxxQ+9MltMh0xECc
	 yfWkdGjdqWfQQ==
Date: Tue, 29 Apr 2025 10:01:12 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, geert@linux-m68k.org,
	paul.barker.ct@bp.renesas.com, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, thierry.bultel@linatsea.fr
Subject: Re: [PATCH v8 03/11] dt-bindings: clock: Add cpg for the Renesas
 RZ/T2H SoC
Message-ID: <174593886824.4084075.3272169793165208261.robh@kernel.org>
References: <20250429081956.3804621-1-thierry.bultel.yh@bp.renesas.com>
 <20250429081956.3804621-4-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429081956.3804621-4-thierry.bultel.yh@bp.renesas.com>


On Tue, 29 Apr 2025 10:19:45 +0200, Thierry Bultel wrote:
> Document RZ/T2H (a.k.a r9a09g077) cpg-mssr (Clock Pulse Generator) binding.
> 
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> ---
> Changes v7->v8:
>   - extra parenthesis
>   - added loco
>   - renesas-cpg-mssr.h: removed unused clocks, added a macro for mstp
> Changes v6->v7:
>   - Add description for reg property
> Changes v5->v6:
>   - Set clock minItem constraint
>   - Moved additionalProperties after 'allOf' section
> Changes v4->v5:
>   - Set reg minItems and maxItems defaults at top level
> Changes v3->v4:
>   - Handle maxItems and clocks names properly in schema.
> ---
>  .../bindings/clock/renesas,cpg-mssr.yaml      | 58 ++++++++++++++-----
>  .../clock/renesas,r9a09g077-cpg-mssr.h        | 48 +++++++++++++++
>  2 files changed, 90 insertions(+), 16 deletions(-)
>  create mode 100644 include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


