Return-Path: <linux-renesas-soc+bounces-19728-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E685B14B28
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Jul 2025 11:23:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C072C7A2E28
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Jul 2025 09:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3042A276038;
	Tue, 29 Jul 2025 09:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nUsR+dq8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0291214F98;
	Tue, 29 Jul 2025 09:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753781001; cv=none; b=PSSojUloDYWXbLim1lfBZapgt1/h8gsx37ODwhkiXhGy7oOaa/ol0f5B5PnJFn6hYCL355oIeRkqkbPJ9qI0PixWaao3YWpTspFncjz1d/qhkxsSD6aiJIDCg3osV86cpzKtcTlikG10M1ay87NsnUHOdSl8MWg/B8Ag/pWs99k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753781001; c=relaxed/simple;
	bh=DTeOnZdMC3MfXRHjclumebjcnfJJ1n0Hu2E8xtaiyFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SaPshSJ1gyLzNTKncKifwoSPrlMRnhZ2epwRRnA3ZrjPEevwPqHlqLhjLunxjM7z/yMzGYfLTNfGRtZUyTMq9FhMeMxCybFSjSwZjpFKb/UE+cLBW3WFEcbiD2K+KBjW/bdchbtpYZSLi92BTg4JEZCWP9ieAmfWyBTB8Pyv6hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nUsR+dq8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7228BC4CEEF;
	Tue, 29 Jul 2025 09:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753781000;
	bh=DTeOnZdMC3MfXRHjclumebjcnfJJ1n0Hu2E8xtaiyFI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nUsR+dq8cm0MFVfSTKWuwUZBsDePzgL98fwFHgU1M4evFQ5cS8Fxul5QI1oZ7KxL6
	 j/qKtHz+dWcsrBegHb/Qe53Syuuv6vRiz/hExL1MP2E0ngADZmfVFS3P6b1P3LrCfj
	 9RoKTFUze6Xx/rZKOm7gtF4Z6lehp+T8VTeSWNAwCQRgGK/BETCnt63J+n2FZEbMF0
	 qLsF0lZS2VVFZ45wyCHszBmIQAYaOtZ7EFlhfW/fpThXkIQpb15UQFXl0fRwKB0OOY
	 H3Bv6K7PPI6HGYYTixYoQ7qIYUwWCasmRje/nSW7nRAHnnLmKXsCDZ9wBnH3Xc/BFX
	 Or9D6MmsG9Zfg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1uggYK-000000002ZZ-3d0o;
	Tue, 29 Jul 2025 11:23:20 +0200
Date: Tue, 29 Jul 2025 11:23:20 +0200
From: Johan Hovold <johan@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] usb: gadget: udc: renesas_usb3: drop unused module alias
Message-ID: <aIiTCDy-_EjUt1zd@hovoldconsulting.com>
References: <20250724092006.21216-1-johan@kernel.org>
 <CAMuHMdU0E_d3XMj6sDeJy8P_UL7ua-_6CnTYqvf2-TD-WXiR3Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdU0E_d3XMj6sDeJy8P_UL7ua-_6CnTYqvf2-TD-WXiR3Q@mail.gmail.com>

Hi Geert,

On Mon, Jul 28, 2025 at 10:56:18AM +0200, Geert Uytterhoeven wrote:

> On Thu, 24 Jul 2025 at 11:21, Johan Hovold <johan@kernel.org> wrote:
> > Since commit f3323cd03e58 ("usb: gadget: udc: renesas_usb3: remove R-Car
> > H3 ES1.* handling") the driver only supports OF probe so drop the unused
> > platform module alias.
> >
> > Signed-off-by: Johan Hovold <johan@kernel.org>
> 
> While I don't debate the actual change, I would like to comment on
> the patch description.  The driver only ever supported OF probe.
> The call to soc_device_match() was just used to override the match
> data for quirk handling.

The driver initially indeed only supported OF probe, but that changed
with commit ca02a5af650c ("usb: gadget: udc: renesas_usb3: Use
of_device_get_match_data() helper") after which the driver could at
least theoretically also bind based on the platform device name.

Johan

