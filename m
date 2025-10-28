Return-Path: <linux-renesas-soc+bounces-23718-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A33CFC13903
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 09:36:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65E7E3ABCFF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 08:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13EEE257842;
	Tue, 28 Oct 2025 08:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="su6e/nu2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09F21DDA24;
	Tue, 28 Oct 2025 08:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761640595; cv=none; b=YKI34t73vS3YCBP/RkzxLbt6ZcNUps5AaM4tPsijlrsgpF8flwKqUbh5k/o3lblbH7sKh0Q99L+Z/c0BSONysmUcPVpap21eWtGbc2mSHq8tOpr06Y7+abvOQAXhQNp7AAf6lX/jEJCNkZQNO9LXwVtLruesTxKZSUz5glcwQY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761640595; c=relaxed/simple;
	bh=H/OqCD1S+BWOBBtmPHLEAs3J7yT5xO+nlIP9e8k47gI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B001DU+QVZou2axHTtienvabh1KUzrSp3mfpfEkhIckr+m1iQZDihGxVeJOCRMRi9BVCkHZ27XZfcATtlakB8Ap7SQtoaCaj9ZhcHayOOvoXHL90XPDvAF2YbJnD7np4WMWAQjmrCIrh79q29MwXfo2DUFVihroHVmxSFB/fCbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=su6e/nu2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CB59C4CEE7;
	Tue, 28 Oct 2025 08:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761640594;
	bh=H/OqCD1S+BWOBBtmPHLEAs3J7yT5xO+nlIP9e8k47gI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=su6e/nu2YSCQYiDOoI34BrWOI1eHjS4COpvpCMWGccTs9hOfvF9cbn8gxiHx42Pbp
	 dyYmC++pbqcOlleA/9U9E5M9KxkQeVC8TB8a6BMVwPBjY/0btXvBexntCfMvvwtzue
	 gaoDLJLUzxZqI4VfbeaJ8jJgRJh+b+BE/NBrB2XRWuuMwnwHwWnLgMA3KF9kJfXZBP
	 fyTy/i0uEZZW1HG5w7uc291KUwXzteDKsC48Tfq9Jv07EeVxTQK36f0fBQZI0ozP+E
	 DcciGuxFHTUPHJ+8iqJt6LeIv+ZJIZIWvz/1joTDAAMOdivzqdg/Zk04+sO0QxkIeQ
	 9dLem2hY0IwXg==
Date: Tue, 28 Oct 2025 09:36:32 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/3] dt-bindings: mailbox: Add Renesas MFIS Mailbox
Message-ID: <20251028-pastoral-efficient-mandrill-c4e9ca@kuoka>
References: <87o6prsl2z.wl-kuninori.morimoto.gx@renesas.com>
 <87jz0fsl0u.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87jz0fsl0u.wl-kuninori.morimoto.gx@renesas.com>

On Tue, Oct 28, 2025 at 04:33:21AM +0000, Kuninori Morimoto wrote:
> Add device tree bindings for the Renesas Multifunctional Inferface

Typo


> (MFIS) a mailbox controller.

You still have mis-ordered patches. Please organize the patch
documenting compatible (DT bindings) before their user.  See also:
https://elixir.bootlin.com/linux/v6.14-rc6/source/Documentation/devicetree/bindings/submitting-patches.rst#L46

> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  .../bindings/mailbox/rcar,mfis-mailbox.yaml   | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/rcar,mfis-mailbox.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/rcar,mfis-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/rcar,mfis-mailbox.yaml
> new file mode 100644
> index 0000000000000..8f5f3a5ea717d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/rcar,mfis-mailbox.yaml


Filename matching fallback compatible. See writing bindings.

I already asked for this and you never replied.

I will not review the rest, please implement all the comments.

Best regards,
Krzysztof


