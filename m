Return-Path: <linux-renesas-soc+bounces-22203-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBA3B95532
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 11:51:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA2431888760
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 09:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 945933191B4;
	Tue, 23 Sep 2025 09:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="T7oAvhoS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F8E2701CF;
	Tue, 23 Sep 2025 09:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758621101; cv=none; b=ZWldDzQbDUsKprWpvbV83iESC7nNb0HQvs3bXbbOJHH6nUKhNr8yD+9SwiC7PI22VFmuiyFjp4k877cEVPNV3LFpXC3yIUXO9e7zjKNi8e4PGvB4PBtt0KMUPp/79cQKy/xyjXQ266F3lFbt6cMVjDIJ9iZ3KooG0qbzTyiQiEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758621101; c=relaxed/simple;
	bh=SatWQ4A40muP0CnZ2G99i8D53j+dxKNMITxD7DwHiYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qXsOiwiRSHrzLu/XbK1gU8j5fEVhW9uqcPfGB1UaYETw01NpwP2TKFkKCZ95tw6c8nCuMTAjmJKhaSQPGHhMZX4RVIyhdL9z+thBRprCmx18PXGnnx21/m13iLykDuoxRTsDMMqGckGxFLkc9LoGKzccGLB7fSNQ2d+ApgT1i4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=T7oAvhoS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25065C4CEF5;
	Tue, 23 Sep 2025 09:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1758621100;
	bh=SatWQ4A40muP0CnZ2G99i8D53j+dxKNMITxD7DwHiYE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T7oAvhoS5m5L3IYdw2JCURK38aoTXhYr7I0UvDxA4xfKxZpRuHgnd33yhCkgPkgpN
	 QxUjzIUjawqeD69zzmjCs0k7rPhdkQKBK48+5GU8nTGQEu2dZ5gvBJQuQIGwmtjCca
	 d+PF3Hs4Irho9yli2i7Hj7NHk6kF0Cschuel/euA=
Date: Tue, 23 Sep 2025 11:51:35 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] serial: sh-sci: Add missing header guard
Message-ID: <2025092311-espresso-collector-5f4d@gregkh>
References: <20250923092846.74517-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923092846.74517-1-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Tue, Sep 23, 2025 at 10:28:46AM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add header guard to sh-sci.h to prevent multiple inclusions of the
> header file.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/tty/serial/sh-sci.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/tty/serial/sh-sci.h b/drivers/tty/serial/sh-sci.h
> index 951681aba586..22f877e2a17e 100644
> --- a/drivers/tty/serial/sh-sci.h

Why is this a .h file at all?  It's so small, why not just put it all in
the .c file and then there's no need for it anymore.

thanks,

greg k-h

