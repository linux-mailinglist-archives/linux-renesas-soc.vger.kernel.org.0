Return-Path: <linux-renesas-soc+bounces-28081-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDScLun2iWl7FAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28081-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Feb 2026 16:02:01 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 196D611169D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Feb 2026 16:02:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39FE4305FFE1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Feb 2026 14:50:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E14F737BE68;
	Mon,  9 Feb 2026 14:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g82imz44"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB992690EC;
	Mon,  9 Feb 2026 14:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770648606; cv=none; b=ma/qU1RRhqhuZ4J6f1bXx78KHuPLb6CslOf4t/1Dlo3+0ZU6W0BN9RLqYXcblB6lhW84mGJC3tyr2yWf5TcwwEisi4FMs22KVWpxzzpMqN6RUdawPIgNJ5WYJAGIJKRqJ8MIbaqDDYnqTPYtIdqlWj1T8TIcFUklB4Eg9HIavyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770648606; c=relaxed/simple;
	bh=71QjBWxw0OgQlaYw34l+1B95cYHentixff/l6mQUZ2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gnZ2im4nNVNg8B5Ddwot/iAWpwPWFdfX5p/dhm7w5r0mkEdKQUC5F8/OtbAmk4CouiZhXi3+9lKIS7FONJsYz1ZhvLNO/tYRLe6o3W+6xNpJEz7Zm0N3xE1Y2fz2ONpwM2SLULA3g9vx0XGa6tiZA2vu7vuQtJlHvB1mEzTSX18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g82imz44; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D572C19422;
	Mon,  9 Feb 2026 14:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770648606;
	bh=71QjBWxw0OgQlaYw34l+1B95cYHentixff/l6mQUZ2U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g82imz44oVmleAdayNSTJmpR4lbwQEBPOduv5UmIyuFb096495+FFpxpJHzTZD+tf
	 SoVfSUVG/+7b834mSxdii+R573nhd7h09BZEbpGdXnjYKZ6uy+SYESyykr5q7+WQqY
	 vr7KJykk6785uHaaEOMk9PfF6a9IDX0yLamE3YPCu9RDZ96g3rQpeUQ+0p5RGnMEp8
	 xzvxyOKAOnTB/2GqridqTbyiCS8HJlu6jXyuyLngdo65+Ty1Tgkn3YAQ3jAJETaP9J
	 nbsQhaI1ANwxOMhVIwA2IH0tcS6QCJCvX4uEqsSlkSH9/QtAQEOANhscV7gsreN8W3
	 ZJeDzErz8JINg==
Date: Mon, 9 Feb 2026 20:19:57 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 4/9] pci: pwrctrl: generic: support for the
 UPD720201/UPD720202 USB 3.0 xHCI Host Controller
Message-ID: <o6e5qygss55p6npjgaicxffsqdpv7kojgidr46zinsvfpxfxug@vn67nq4k6jzk>
References: <20260206-topic-sm8650-ayaneo-pocket-s2-base-v3-0-5b79c5d61a03@linaro.org>
 <20260206-topic-sm8650-ayaneo-pocket-s2-base-v3-4-5b79c5d61a03@linaro.org>
 <fbxbnou5mdlhaq5dpxr3wdzmjetwdp7auaaqeunc67tgk5ej2m@cnnkr2pcwy77>
 <a4e55e91-0e03-4e63-8542-d8ad61b38906@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a4e55e91-0e03-4e63-8542-d8ad61b38906@linaro.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28081-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com,vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 196D611169D
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 03:00:02PM +0100, Neil Armstrong wrote:
> On 2/9/26 12:30, Manivannan Sadhasivam wrote:
> > On Fri, Feb 06, 2026 at 03:50:32PM +0100, Neil Armstrong wrote:
> > > Enable the generic pwrctrl driver to control the power of the
> > > PCIe UPD720201/UPD720202 USB 3.0 xHCI Host Controller.
> > > 
> > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > ---
> > >   drivers/pci/pwrctrl/generic.c | 4 ++++
> > >   1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/drivers/pci/pwrctrl/generic.c b/drivers/pci/pwrctrl/generic.c
> > > index 08e53243cdbd..4a57a631362f 100644
> > > --- a/drivers/pci/pwrctrl/generic.c
> > > +++ b/drivers/pci/pwrctrl/generic.c
> > > @@ -73,6 +73,10 @@ static const struct of_device_id pci_pwrctrl_slot_of_match[] = {
> > >   	{
> > >   		.compatible = "pciclass,0604",
> > >   	},
> > > +	/* Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller */
> > > +	{
> > > +		.compatible = "pci1912,0014",
> > 
> > No need to add the compatible to the driver. Just use the existing compatible as
> > fallback in the binding/dts.
> 
> ???
> 
> Sorry but this is insane, in no world a standalone PCIe USB controller could be qualified as
> compatible as a pciclass,0604 slot.
> 

AFAIU, 'compatibility' implies that the driver can safely fallback and would
still work. If we add dedicated compatibles for each endpoint devices, then we
will just keep adding forever. Powering up a PCIe slot and an endpoint device
are conceptually same.

> Technically it would work just fine, but "compatibility" has a meaning....
> 

I view compatibility interms of device operation, not device as a whole. But
sure, I could be wrong. If the DT maintainers say so, I won't insist.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

