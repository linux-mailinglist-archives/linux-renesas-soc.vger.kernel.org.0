Return-Path: <linux-renesas-soc+bounces-28105-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oZl6JpTlimnwOgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28105-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 09:00:20 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3E0118171
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 09:00:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7014301BCFE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 08:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09CB833C1BD;
	Tue, 10 Feb 2026 08:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cf1vDTs7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D732B33BBBA;
	Tue, 10 Feb 2026 08:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770710415; cv=none; b=K6Oj3q9VY8LPTXiUUgfxRvvOa0NjOQz25d/Cf3GxgJL5KaeJ0pQqqqoM2RTcPC78xlguntzxxM4ZexOwdAMJjxvlFyRaPptKZ9UDhvObarNEq9CNc/dwnBRvtXBmEdET7JgfEZAZGUCtAQd5vxYPGe0Q7YC5AEpGRXyBkbjKkJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770710415; c=relaxed/simple;
	bh=vGVI1GPobS6Ck1Wc7xRE4xQgoD9fzTTbpIBQJmAWkN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tblai39I+SWkYbY8gX88aTez2U8vZ980dwFMKkSN/RuRregPlF31ngc4tvWpmyumGGIdXHoePztXs8jLAWZkbP9TCq6MJ0VeGxOTWUDDW/es1rODQGzivXTMX0f4D8CpTTF0AGUYyYna42ppAiMKcbIn0pcpWIJOf9+5GwSfybY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cf1vDTs7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4140C116C6;
	Tue, 10 Feb 2026 08:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770710415;
	bh=vGVI1GPobS6Ck1Wc7xRE4xQgoD9fzTTbpIBQJmAWkN8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cf1vDTs7Vt5yAzTw7XCYMmNQVRMZNfbAE5sKfuaS06LYSpGraP0BFz/2Ekl4BUaaS
	 t8eaACG3ybXmLyuBRT7bpXM5CHChiCP72i31nLi1jIOapgVehyRlOVVIx0kgCsgmIC
	 eJ2ct79hJYRMzNYVD/reWGeObYu0yTo/r0OyMFwcfT1S+YlJWqRc2xYPknJ3zCNksP
	 EKXK2DqAiNp43uRvSeaY0njRhWXUiM+/SHJE+cs9m64oBT4YnYlsXOhU0JZeHd1uFf
	 08KQ4jwCIVKknAPLZ4f97rFp9cK1zF7xZy14rCr/OxQu2W1AuYCZfPpR1SHz0cq0D4
	 n6wzNl5xqtZDg==
Date: Tue, 10 Feb 2026 13:30:05 +0530
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
Message-ID: <qd5egc42mkdofs4ey7gl664e5el2p5sxwluesjtm7gc3y66hez@l4dz3bd5xm6n>
References: <20260206-topic-sm8650-ayaneo-pocket-s2-base-v3-0-5b79c5d61a03@linaro.org>
 <20260206-topic-sm8650-ayaneo-pocket-s2-base-v3-4-5b79c5d61a03@linaro.org>
 <fbxbnou5mdlhaq5dpxr3wdzmjetwdp7auaaqeunc67tgk5ej2m@cnnkr2pcwy77>
 <a4e55e91-0e03-4e63-8542-d8ad61b38906@linaro.org>
 <o6e5qygss55p6npjgaicxffsqdpv7kojgidr46zinsvfpxfxug@vn67nq4k6jzk>
 <b46da4da-93aa-4213-ad75-ec7709008b95@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b46da4da-93aa-4213-ad75-ec7709008b95@linaro.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28105-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EB3E0118171
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 03:59:20PM +0100, Neil Armstrong wrote:
> On 2/9/26 15:49, Manivannan Sadhasivam wrote:
> > On Mon, Feb 09, 2026 at 03:00:02PM +0100, Neil Armstrong wrote:
> > > On 2/9/26 12:30, Manivannan Sadhasivam wrote:
> > > > On Fri, Feb 06, 2026 at 03:50:32PM +0100, Neil Armstrong wrote:
> > > > > Enable the generic pwrctrl driver to control the power of the
> > > > > PCIe UPD720201/UPD720202 USB 3.0 xHCI Host Controller.
> > > > > 
> > > > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > > > ---
> > > > >    drivers/pci/pwrctrl/generic.c | 4 ++++
> > > > >    1 file changed, 4 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/pci/pwrctrl/generic.c b/drivers/pci/pwrctrl/generic.c
> > > > > index 08e53243cdbd..4a57a631362f 100644
> > > > > --- a/drivers/pci/pwrctrl/generic.c
> > > > > +++ b/drivers/pci/pwrctrl/generic.c
> > > > > @@ -73,6 +73,10 @@ static const struct of_device_id pci_pwrctrl_slot_of_match[] = {
> > > > >    	{
> > > > >    		.compatible = "pciclass,0604",
> > > > >    	},
> > > > > +	/* Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller */
> > > > > +	{
> > > > > +		.compatible = "pci1912,0014",
> > > > 
> > > > No need to add the compatible to the driver. Just use the existing compatible as
> > > > fallback in the binding/dts.
> > > 
> > > ???
> > > 
> > > Sorry but this is insane, in no world a standalone PCIe USB controller could be qualified as
> > > compatible as a pciclass,0604 slot.
> > > 
> > 
> > AFAIU, 'compatibility' implies that the driver can safely fallback and would
> > still work. If we add dedicated compatibles for each endpoint devices, then we
> > will just keep adding forever. Powering up a PCIe slot and an endpoint device
> > are conceptually same.
> 
> We're not speaking about driver here, but about compatible string which describes
> a device, a PCI endpoint and a PCIe slot are 2 very different devices that are
> nowhere compatible.
> 
> > 
> > > Technically it would work just fine, but "compatibility" has a meaning....
> > > 
> > 
> > I view compatibility interms of device operation, not device as a whole. But
> > sure, I could be wrong. If the DT maintainers say so, I won't insist.
> 
> In the actual way it's defined _today_, the "slot" and "endpoint" power up schemes are
> compatible, but I hope the slot bindings will get much more features to describe the
> real world slots power properties. And no, endpoints will definitely not have the same
> features as slots, using it as a fallback today is an error.
> 
> On the other side, adding a "simple-pci-endpoint" compatible that enables any supply
> and clock would be a good solution, if the DT maintainers agrees of course.
> 

We do have a 'pci-host-cam-generic' compatible. So we can also have something
like 'pci-pwrctrl-generic' IMO.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

