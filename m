Return-Path: <linux-renesas-soc+bounces-23722-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60359C13AFE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 10:05:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B70611AA5EBA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 09:06:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA7B52E8B71;
	Tue, 28 Oct 2025 09:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yOPeYmOn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CEF2E888A;
	Tue, 28 Oct 2025 09:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761642325; cv=none; b=XYmKu4Bo09jZTEveIMIkzhkmJ9vzB78Qgv+7lOt/0hwy/GFMIqP9QijYxeNx48vvo3bfC0hKddxI05sC/PbrhLx7LeKFKEVKL6HDKwwfOrZWN9fg/TINvhCosIYJF9vAxPYL6E2w9201JuwnvXOObofPTjfAuwe3A74mbN2FAYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761642325; c=relaxed/simple;
	bh=J0Dfq9ajIylLWV13UgO/nPeci2RCcVyAESvzuDWgNMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a8Ntx6qYEOT6viYFIns4Sr9LbVT2u8lWLzqeUkkcFEauYQY0H32hCw1pwVQFg+/ZrH+esPJOlbmH6i58Gu8PoqcykHL73tIn2yiQYC6g0r4JTL3YyhXWnUWOyYZsCXZwFktZzivr13HZgIyfBJpyrNpFRbub9ynpIYLB57wMzoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yOPeYmOn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54536C4CEE7;
	Tue, 28 Oct 2025 09:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1761642325;
	bh=J0Dfq9ajIylLWV13UgO/nPeci2RCcVyAESvzuDWgNMU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yOPeYmOn687M4UHq8SdztLSF9+bAutwnREs89FisJIqR4hYfEJjmI17H4cxiDkot2
	 rkVsYInkxyKq75nYBu4jrNPpRBA/zQvtw3q0yCB5oRPVhGJ+Tfx8evPQDASKWOXDV0
	 h/ppcdj5M4E7Gm0boe+dl/i8WUiyyIlSiHuH9Eeg=
Date: Tue, 28 Oct 2025 09:40:35 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Nam Cao <namcao@linutronix.de>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org, stable@kernel.org
Subject: Re: [PATCH 04/19] serial: sh-sci: Fix deadlock during RSCI FIFO
 overrun error
Message-ID: <2025102826-appraisal-tables-47b6@gregkh>
References: <20251027154615.115759-1-biju.das.jz@bp.renesas.com>
 <20251027154615.115759-5-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027154615.115759-5-biju.das.jz@bp.renesas.com>

On Mon, Oct 27, 2025 at 03:45:51PM +0000, Biju Das wrote:
> On RSCI IP, a deadlock occurs during a FIFO overrun error, as it uses a
> different register to clear the FIFO overrun error status.
> 
> Cc: stable@kernel.org
> Fixes: 0666e3fe95ab ("serial: sh-sci: Add support for RZ/T2H SCI")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Why is patch 4/19 the only one marked for stable backports?  That feels
really wrong as that will not show up until after 6.19-rc1 is out, AND
the dependant patches will also not be backported.

Please split up patch series to have "things that must be merged now"
separate from "these are for the next -rc1 release"

thanks,

greg k-h

