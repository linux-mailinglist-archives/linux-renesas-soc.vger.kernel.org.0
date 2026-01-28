Return-Path: <linux-renesas-soc+bounces-27504-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QORRL4jBeWl/ywEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27504-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 08:58:00 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C199DEA9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 08:58:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7B776300E263
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 07:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CA6232BF21;
	Wed, 28 Jan 2026 07:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UvJ0Hx6f"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565DD2C0F8C;
	Wed, 28 Jan 2026 07:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769587048; cv=none; b=bnREF3ts97Bv+F8fERJBrRGReWZVrPtCYDMzi0OBwcgCsI25cNUzch3Lyo9ly2Icp9G3DUU+bfx+F86qoAnqXOIYBopQgYYbVKWZ26wAYvW5LjICQpmURsyfmoKIrhv0bRlk4UqkLT8EOpYHNjW2jJ1Q/yGzGhmzhgP2NRU39sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769587048; c=relaxed/simple;
	bh=Edxazn8QS4dzQlUgaoJvS2lJwVXq0yRqauGtKDHAMGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mLwaCCU9Fcjd1Yb9r+7+fKJwzwF8suejEJ9JdZ29LCXflbFlAqEZ/3a3CHRbcscFwong9984NGeHO9tYvr+rOwnemZFEzvvLUj42tWczhpJXX+zpSlp80p2uehyS19g1vAmXXKElbvIw80EkSfY3Y5csWU7bP9qCFBpUyQOGb/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UvJ0Hx6f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEF4AC4CEF1;
	Wed, 28 Jan 2026 07:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769587048;
	bh=Edxazn8QS4dzQlUgaoJvS2lJwVXq0yRqauGtKDHAMGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UvJ0Hx6fEVhv2jb1LSVkEQLToIpw9cNVss0Rnqo1n3hSjVuN5KgSN9s/95Ut7EIou
	 bFD2BKZjRl9MmGNDLIL81X+rwLYoaTU2zOC0EJGmUNLCh/DYFlZusV0S5d4zhdx8jf
	 rS4JVEjsHlAJ93oLeXNseazRIp0vQkzkQw0nRr32ZLGFzjjs/QJ17apYUgf0I2QY22
	 /aTvbu7/qdiBjOepoXE+V7ndBmBNFJmlA29n7j7rZmCw1lBeN9niSuuv9LhrYPlfIY
	 OcOALjnZuHyTnBp7SN3wWT6Zi6Vmiad/N9Ux23JF3KFsnN8iClXPFlcILqKjM8skmG
	 ix5wDgU9Hc4CA==
Date: Wed, 28 Jan 2026 13:27:15 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-pci@vger.kernel.org
Subject: Re: [PATCH v2 2/7] pci: pwrctrl: add PCI pwrctrl driver for the
 UPD720201/UPD720202 USB 3.0 xHCI Host Controller
Message-ID: <ppe6w2h32vx2jh73bcv7ip7ubr2wgwjsz4ooruplpx7gx5s4rv@qfasjbocku4r>
References: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org>
 <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-2-c55ec1b5d8bf@linaro.org>
 <llbnkm72mgcsrucnp7pdkwbgyzenvhe4kudxkdixplgaoirdem@3q3me34o5drf>
 <0104896e-44d0-485a-a44e-694864c819b7@linaro.org>
 <33bbb3ec-5659-4d50-a5ff-dafa44e291dd@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <33bbb3ec-5659-4d50-a5ff-dafa44e291dd@rock-chips.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27504-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linuxfoundation.org,glider.be,google.com,vger.kernel.org,lists.freedesktop.org];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 32C199DEA9
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 02:22:50PM +0800, Shawn Lin wrote:
> 在 2026/01/28 星期三 5:53, Neil Armstrong 写道:
> > On 1/27/26 16:53, Manivannan Sadhasivam wrote:
> > > On Tue, Jan 27, 2026 at 10:57:29AM +0100, Neil Armstrong wrote:
> > > > Add support fo the Renesas UPD720201/UPD720202 USB 3.0 xHCI Host
> > > > Controller
> > > > power control which connects over PCIe and requires specific
> > > > power supplies
> > > > to start up.
> > > > 
> > > 
> > > This driver only handles the supplies. So why can't you use the existing
> > > pwrctrl-slot driver as a fallback?
> > 
> > It would fit with no change, but the name "slot" doesn't match the goal
> > here,
> > it's not a slot at all, it's an actual pcie IC.
> > 
> 
> How about renaming slot.cto something like pci-pwrctrl-simple.c, especially
> if most power sequences fit into this category? This would follow the naming
> example seen in other subsystems, such as drivers/mmc/core/pwrseq_simple.c.
> 

Yes. There is no point in duplicating the drivers just for a different name.
Slot driver is relatively new. So I don't think there would be issues in
renaming the module name.

I'd prefer for 'pci-pwrctrl-generic.ko' for module name and 'generic.c' for
driver name.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

