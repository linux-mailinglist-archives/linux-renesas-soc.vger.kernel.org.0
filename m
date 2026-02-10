Return-Path: <linux-renesas-soc+bounces-28113-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBUVBnkQi2l/PQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28113-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 12:03:21 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C0A119F1A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 12:03:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A9D83028ECA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 11:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6FF93164C8;
	Tue, 10 Feb 2026 11:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ikP5l9oN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8BB219E8D;
	Tue, 10 Feb 2026 11:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770721397; cv=none; b=c47bPvEv4VELPpuqvo3u6iWOykxojY3YpWUM3yoWvUNDdS0pwc9gRoTGnLBajfc+aJwqUvrLeKcsvckLpEG7u6zjFuPWNuEZXVWH831pSC/pEJDJiL1aO5EbPJcwTQ3iYXOsfI2pk++Y44lJeLOvND2/PuN9KNStf7T/vdh4GYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770721397; c=relaxed/simple;
	bh=/KAJwsOfzjcbdFRa/f2yuz2k36Ieq8U26aqf651uN30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=liqFmdxK0cxkbPwTrMVkHs82bRkb/sS43JQodzt3MxkzDYCncZ9peEgFLPRCk5ip0jnIeJ7Zf7zElx4jCbX8SkS6tjvDFUXA7wHeylbPQohMAcOhE8FDTNXIHqjoy0Tkpfj3m4AnCtdYi0xP4ufQ0b8kSElJ9haaiCsuNP94t5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ikP5l9oN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 245E1C116C6;
	Tue, 10 Feb 2026 11:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770721397;
	bh=/KAJwsOfzjcbdFRa/f2yuz2k36Ieq8U26aqf651uN30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ikP5l9oNoYzUIkoNv3xsVnpGElh6FK9rDCJCRcwtPicDAjP8fR1XkSWqAzTnBetT7
	 d8WF/lC/kt3qBCBumWT27M80y4LKqL1Ew9kuN6lxMoIfV/uFyCW5FDy1ewthp7ukWZ
	 a16TfnfK3Pk/auhIeh2vU1I3T3ZGLOdtHuPlm9ljTRM2U8vAP6vERfAVrNwMaHZciL
	 SIEQ0wcBm2LiD/k7HyAC8KVU+UgmjhbA06BTq6bhIa7B/AdGgDyybrJ1nL2Ltm4c5M
	 gTdcKFDckohBX96qFpo6I5h3KC1EUj4HrC6BUFRlxzkEPdmvRu7uwxnkc6Uz4yy2bR
	 I4VXX6sPhg3yw==
Date: Tue, 10 Feb 2026 16:33:08 +0530
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
Message-ID: <cish7iljd23mon4onzbonpuvii7mccwygllr3bcqcpo7zbp2o2@lbzokxr6dod3>
References: <20260206-topic-sm8650-ayaneo-pocket-s2-base-v3-0-5b79c5d61a03@linaro.org>
 <20260206-topic-sm8650-ayaneo-pocket-s2-base-v3-4-5b79c5d61a03@linaro.org>
 <fbxbnou5mdlhaq5dpxr3wdzmjetwdp7auaaqeunc67tgk5ej2m@cnnkr2pcwy77>
 <a4e55e91-0e03-4e63-8542-d8ad61b38906@linaro.org>
 <o6e5qygss55p6npjgaicxffsqdpv7kojgidr46zinsvfpxfxug@vn67nq4k6jzk>
 <b46da4da-93aa-4213-ad75-ec7709008b95@linaro.org>
 <qd5egc42mkdofs4ey7gl664e5el2p5sxwluesjtm7gc3y66hez@l4dz3bd5xm6n>
 <8b18433a-5836-4a65-b790-9f51112d1f5c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8b18433a-5836-4a65-b790-9f51112d1f5c@linaro.org>
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
	TAGGED_FROM(0.00)[bounces-28113-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: 70C0A119F1A
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 10:01:00AM +0100, Neil Armstrong wrote:
> On 2/10/26 09:00, Manivannan Sadhasivam wrote:
> > On Mon, Feb 09, 2026 at 03:59:20PM +0100, Neil Armstrong wrote:
> > > On 2/9/26 15:49, Manivannan Sadhasivam wrote:
> > > > On Mon, Feb 09, 2026 at 03:00:02PM +0100, Neil Armstrong wrote:
> > > > > On 2/9/26 12:30, Manivannan Sadhasivam wrote:
> > > > > > On Fri, Feb 06, 2026 at 03:50:32PM +0100, Neil Armstrong wrote:
> > > > > > > Enable the generic pwrctrl driver to control the power of the
> > > > > > > PCIe UPD720201/UPD720202 USB 3.0 xHCI Host Controller.
> > > > > > > 
> > > > > > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > > > > > ---
> > > > > > >     drivers/pci/pwrctrl/generic.c | 4 ++++
> > > > > > >     1 file changed, 4 insertions(+)
> > > > > > > 
> > > > > > > diff --git a/drivers/pci/pwrctrl/generic.c b/drivers/pci/pwrctrl/generic.c
> > > > > > > index 08e53243cdbd..4a57a631362f 100644
> > > > > > > --- a/drivers/pci/pwrctrl/generic.c
> > > > > > > +++ b/drivers/pci/pwrctrl/generic.c
> > > > > > > @@ -73,6 +73,10 @@ static const struct of_device_id pci_pwrctrl_slot_of_match[] = {
> > > > > > >     	{
> > > > > > >     		.compatible = "pciclass,0604",
> > > > > > >     	},
> > > > > > > +	/* Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller */
> > > > > > > +	{
> > > > > > > +		.compatible = "pci1912,0014",
> > > > > > 
> > > > > > No need to add the compatible to the driver. Just use the existing compatible as
> > > > > > fallback in the binding/dts.
> > > > > 
> > > > > ???
> > > > > 
> > > > > Sorry but this is insane, in no world a standalone PCIe USB controller could be qualified as
> > > > > compatible as a pciclass,0604 slot.
> > > > > 
> > > > 
> > > > AFAIU, 'compatibility' implies that the driver can safely fallback and would
> > > > still work. If we add dedicated compatibles for each endpoint devices, then we
> > > > will just keep adding forever. Powering up a PCIe slot and an endpoint device
> > > > are conceptually same.
> > > 
> > > We're not speaking about driver here, but about compatible string which describes
> > > a device, a PCI endpoint and a PCIe slot are 2 very different devices that are
> > > nowhere compatible.
> > > 
> > > > 
> > > > > Technically it would work just fine, but "compatibility" has a meaning....
> > > > > 
> > > > 
> > > > I view compatibility interms of device operation, not device as a whole. But
> > > > sure, I could be wrong. If the DT maintainers say so, I won't insist.
> > > 
> > > In the actual way it's defined _today_, the "slot" and "endpoint" power up schemes are
> > > compatible, but I hope the slot bindings will get much more features to describe the
> > > real world slots power properties. And no, endpoints will definitely not have the same
> > > features as slots, using it as a fallback today is an error.
> > > 
> > > On the other side, adding a "simple-pci-endpoint" compatible that enables any supply
> > > and clock would be a good solution, if the DT maintainers agrees of course.
> > > 
> > 
> > We do have a 'pci-host-cam-generic' compatible. So we can also have something
> > like 'pci-pwrctrl-generic' IMO.
> 
> I don't want to into this route, I just want to powerup the USB3 controller on
> the Pocket S2 gaming device, not spend 6 months into _not_ modifying a driver compatible
> list.
> 

Sure, I don't want you to spend that much time either. But I was trying to avoid
having a solution that just works only for your platform.

> All this feels bulky, who a pci device would be compatible with something like
> 'pci-pwrctrl-generic' we're speaking about a pci device, not a power control device.
> 
> It's nowhere similar to the 'pci-host-cam-generic' situation, this describes well defined
> host controller interface.
> 

I honestly don't see much difference. ECAM is just *a way* of accessing the
config space of the PCIe devices. If we can have a compatible based on that,
then I don't see why can't we have one for pwrctrl. Only difference is that
"pwrctrl" terminology is not part of any spec, but for sure every device would
have some kind of power control implementation.

Anyhow, I don't have other solutions on top of my head now. Let's go with
per-device compatible for now. I'll deal with a generic solution later.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

