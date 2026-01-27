Return-Path: <linux-renesas-soc+bounces-27496-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEhoLYQ7eWkmwAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27496-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jan 2026 23:26:12 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF469B028
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jan 2026 23:26:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ADFB9300B9ED
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jan 2026 22:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6C213612D4;
	Tue, 27 Jan 2026 22:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gxtNCvvy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C040284690;
	Tue, 27 Jan 2026 22:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769552769; cv=none; b=CVSDZLKJCC6t1ac+ChtAyX0qrFJUPrcbxw7brnQrNBD+wmPnec96inxdBdE8Zb55H3zXlGyYKIAsa8FKXEeqierfL7lwUl3cRpRPieGA5rMr7bjHvWu1XXgfJqKireIZfbaekDGwuHSU66Et1bLwgYA0GTU3T6Y57MDVEKnf3+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769552769; c=relaxed/simple;
	bh=hOESQfi/mcB2OvWXOXQ+Rx2MANJ14AZw9LBZgfJgdr4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=JVYtnb2eHPaRUdSYvr6BD/RLtKQq77Dm/WJDR/JdrX+7NOuci0iLSAlGVwmljChyHTNHns3wOS44qwpcT6YafGMEO+6qT2yVghke7ZlBfGPUNSq4YsM6+7YTOVaXwFKOeJ81vPWOjIMz+5GApMn3gfzdl7lI3Q3zm02Awc+LzQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gxtNCvvy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9FB6C116C6;
	Tue, 27 Jan 2026 22:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769552769;
	bh=hOESQfi/mcB2OvWXOXQ+Rx2MANJ14AZw9LBZgfJgdr4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=gxtNCvvyjeIMnwD3W+/JsVjaP9mZNM6H6JzZ5jIY4goJ5UoCDXbZinm+wgo7Nakow
	 5JdH0h3bhCHKl4vbewCA9uW4XQyoxNxEBHuiyQZRSnmP8mpXnIEnej79LiaFsDpBf/
	 2TpuTCqqbk4pqeQ1QDyTh1kDk5YcUSnMuvexK4rgd7gSXMgxGaR9/PQUNRjcGwMTHz
	 RnUHsn5nhj2ybhNytESQFGyrxqrIUIhGZ15TBT9VIDtSopFRW5RAtNVFzWdtq5yURe
	 cRAY3+uHWmOcpznArOe+2iTgdFPnRs91ju+6XOOtOu5iNNvlHGYqrlJ+1A9wVJlftc
	 NH6pCUpGzidFQ==
Date: Tue, 27 Jan 2026 16:26:07 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH v2 2/7] pci: pwrctrl: add PCI pwrctrl driver for the
 UPD720201/UPD720202 USB 3.0 xHCI Host Controller
Message-ID: <20260127222607.GA379611@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0104896e-44d0-485a-a44e-694864c819b7@linaro.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27496-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linuxfoundation.org,glider.be,google.com,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4EF469B028
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 10:53:50PM +0100, Neil Armstrong wrote:
> On 1/27/26 16:53, Manivannan Sadhasivam wrote:
> > On Tue, Jan 27, 2026 at 10:57:29AM +0100, Neil Armstrong wrote:
> > > Add support fo the Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller
> > > power control which connects over PCIe and requires specific power supplies
> > > to start up.
> > 
> > This driver only handles the supplies. So why can't you use the existing
> > pwrctrl-slot driver as a fallback?
> 
> It would fit with no change, but the name "slot" doesn't match the
> goal here, it's not a slot at all, it's an actual pcie IC.

"slot" is probably an overly specific name.  Maybe we can solve it
with a better name.

