Return-Path: <linux-renesas-soc+bounces-15847-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BF1A8612A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Apr 2025 16:58:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 648BD1B875E6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Apr 2025 14:57:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8AD71F7575;
	Fri, 11 Apr 2025 14:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gDx38se1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCA71F5827;
	Fri, 11 Apr 2025 14:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744383448; cv=none; b=gTX3qPXRzgLgMkY5gE4zfXSv4A2u/Hf5QU0GA21xxmZD7pitjHjZru1iQyNpE+vkreVMqS1MbkrSFJ4q91TfYSDgXdM//x9etFR38ynntgTPkHEmH6WPCLewjBOJjk0IHUHv2AsMHZVW+NPy+91Om642C5sG02gq0ZJljdn6t7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744383448; c=relaxed/simple;
	bh=T5oHrVbXP56dRNBGSCdGaviDwIp0EdmHjG+wEyMK04Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mEgjCxECR5iCecbhWtzjO0QD3SgqOz7CDrneRYMPPFfDiEOCpc4gG3WaQOFAaBUiHXi3XDjn/xLsPNnpCVU1UAQHFWP8tLy/QXQjFoyl5uAuMQs/Yau4vtcuvvB25XUS4a3GfPTDeCD5yjU62/lW41TEHs9L4VndMcdwt3ETiZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gDx38se1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A024C4CEE2;
	Fri, 11 Apr 2025 14:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744383448;
	bh=T5oHrVbXP56dRNBGSCdGaviDwIp0EdmHjG+wEyMK04Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gDx38se1gXERwBqYkCXoQbH26eSrIY4TISh51W7tsyGUtrKFeBwEDSftszj0AQ9Yy
	 4qmGa1TBElqRFnKeu/pFOY7qbDbRG2W7zvvy2iJQjFHgJgJ+AqKxMy6joDFsRuAEhL
	 +kUxaTCNN3uOo6QhrNcnS1ObGbaj7FXO+Kxf3qXE=
Date: Fri, 11 Apr 2025 16:57:25 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org, paul.barker.ct@bp.renesas.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v7 10/13] serial: sh-sci: Add support for RZ/T2H SCI
Message-ID: <2025041152-puzzling-clinking-e573@gregkh>
References: <20250403212919.1137670-1-thierry.bultel.yh@bp.renesas.com>
 <20250403212919.1137670-11-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403212919.1137670-11-thierry.bultel.yh@bp.renesas.com>

On Thu, Apr 03, 2025 at 11:29:12PM +0200, Thierry Bultel wrote:
> --- a/include/uapi/linux/serial_core.h
> +++ b/include/uapi/linux/serial_core.h
> @@ -231,6 +231,9 @@
>  /* Sunplus UART */
>  #define PORT_SUNPLUS	123
>  
> +/* SH-SCI */
> +#define PORT_RSCI	124

Why do you need to tell userspace about this specific port?  Is that a
hard requirement that your userspace tools require?  If not, please
don't export this here.

thanks,

greg k-h

