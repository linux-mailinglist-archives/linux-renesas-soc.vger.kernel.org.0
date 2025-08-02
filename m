Return-Path: <linux-renesas-soc+bounces-19945-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66732B19055
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  3 Aug 2025 00:30:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E528C189AA71
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Aug 2025 22:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA495255E23;
	Sat,  2 Aug 2025 22:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="jBnw6MqO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F368134A8;
	Sat,  2 Aug 2025 22:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754173829; cv=none; b=sGXDSyhaPW1SB5wFLxYPdAOw/OXZFLGLKvfpifUWIkJlIhU+GHpESQJhp9IMb9yGs2nE0GMB5wuUWCslZwsylkW3z8tESt+mJY3a6dM36ROx0hSt0EVymQNLCgKemm+6Z5o+tsleTQyBaHZ1ZoQGqr4d/qKNub7SLt8IBAXPDMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754173829; c=relaxed/simple;
	bh=YuE0+6sLSxtJRgSKgy3PSeF5ac9It8JY3n8ltL3TB3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J+eOnj0ohbz0vxzu/84i8XNYLe4Gbfyt6PrwnDks3xIKMC75s+f4WesS2CujsVpiVZhnu6mE9G834zkUVBQ1OLUzdc7J92ETRoYOKCefFsJc+d8IVPXwCwlZX7EboP7Eg+5ScosbhcdQE9i0FSc1uHfSueRirdfxgnga8wOZ/p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=jBnw6MqO; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4bvcvt3qyvz9sV2;
	Sun,  3 Aug 2025 00:30:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1754173818;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MC7QH3x5cJ7TXXDJLexu3TYY1J29xX385Fsn2GQ+DYc=;
	b=jBnw6MqO7vN5bCcc7qK+TWtkOgsVBx+yk80BcAINTC++wHirYSeivps8+++RL7t4IdKfzq
	J7R7Bg9C4s48uFey6z4sbmC6UmAm3yuG9xeGnQPSAjTwikHmAxLobMD9XEz83/40z+ggfE
	r65Aw+BlbKqba7xHdxnf907gvDJfUWDCoPEyHYLhE3O0mLqmWtBEpUr51YkdBckEKK+Uha
	v0wUSi1LDz7qyKUMLmJ3Y6+XjB8hC2jAlgDtcG9ZNO4YQNV7UjQ0vbCDStniYx0WtpT8Po
	kr4qKiChMfbBjc0GN40mMYMsz6Y4C8vNSIA/qyjhnjFWJYWoDXpkdHWlyCOzow==
Message-ID: <e542b685-4af4-4172-9b66-84db6443bc8b@mailbox.org>
Date: Sun, 3 Aug 2025 00:30:15 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] usb: renesas-xhci: Fix External ROM access timeouts
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@intel.com>, Vinod Koul <vkoul@kernel.org>,
 stable@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20250727154516.11599-1-marek.vasut+renesas@mailbox.org>
 <20250729121759.0e9df735@foxbook>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20250729121759.0e9df735@foxbook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: xpsocbaafnmbrm665azd3gu3ha33kqmb
X-MBO-RS-ID: 0b0e93c5700dae42c65

On 7/29/25 12:17 PM, Michał Pecio wrote:
> Hi,

Hi,

> On Sun, 27 Jul 2025 17:44:16 +0200, Marek Vasut wrote:
>> Increase the External ROM access timeouts to prevent failures during
>> programming of External SPI EEPROM chips. The current timeouts are
>> too short for some SPI EEPROMs used with uPD720201 controllers.
>>
>> The current timeout for Chip Erase in renesas_rom_erase() is 100 ms ,
>> the current timeout for Sector Erase issued by the controller before
>> Page Program in renesas_fw_download_image() is also 100 ms. Neither
>> timeout is sufficient for e.g. the Macronix MX25L5121E or MX25V5126F.
> 
> Out of curiosity, who uses this ROM update functionality and why?

arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts

The factory will likely use this code path to preload the SPI EEPROM 
during board production and testing.

> It seems weird to write nonvolatile memories in a PCI probe routine.
> Boards or PCIe cards fitted with ROMs are programmed with working
> firmware at the factory and there ought to be no need to touch that.

See above.

> And if you want to update this FW, dropping a file in /lib/firmware/
> and loading a kernel module is not the usual (or convenient) UI...

See above.

-- 
Best regards,
Marek Vasut

