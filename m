Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37BEE6922B5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Feb 2023 16:55:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232398AbjBJPzE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Feb 2023 10:55:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232026AbjBJPzD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Feb 2023 10:55:03 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C497F4B749;
        Fri, 10 Feb 2023 07:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676044502; x=1707580502;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=TyUHHmCPATP1lTLZ8QD7F3FBaAklMw8Mo4NnSwvAAGA=;
  b=STGWdYt14ston01GwI7uk8kYdtmge0Q88flBIQmhLZLLnhu3kjWJmjK0
   NFaY0vRJ9ZGwbU+ZBpp7SLOIenyI+ELf6dSVwP9aEk6XaR8UbpCAor1PM
   ruOGgytdChWxaIDgzlguwDkokR44+rQAnlOE5EzArBn5cQm37n0Hmi7z8
   IVE+o92MdRrDtNnoUegZis9NadiP8wVOvS03KR6fELx4G+G+okbjiWMLM
   tI9hVtiDwk3MvRCiXaE9F4SBT63ZWvmsQfhpDRVNymfFF1j8mZdfqUt6l
   WR/1OWVz67BoO27Q722t0pvSnCCgkfwoJYpQSNMXbGWUZxuqhVVfLfyfS
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="331752994"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="331752994"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 07:55:02 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="700514829"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="700514829"
Received: from tnemeth-mobl1.ger.corp.intel.com ([10.251.213.60])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 07:54:59 -0800
Date:   Fri, 10 Feb 2023 17:54:57 +0200 (EET)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-serial <linux-serial@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/3] serial: 8250_em: Update RZ/V2M port type as
 PORT_16750
In-Reply-To: <20230210154140.338352-3-biju.das.jz@bp.renesas.com>
Message-ID: <c4df46fb-6f89-90bb-3d21-70538794ae40@linux.intel.com>
References: <20230210154140.338352-1-biju.das.jz@bp.renesas.com> <20230210154140.338352-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-472954745-1676044501=:1761"
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-472954745-1676044501=:1761
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Fri, 10 Feb 2023, Biju Das wrote:

> The UART IP found on RZ/V2M SoC is Register-compatible with the
> general-purpose 16750 UART chip. This patch updates RZ/V2M
> port type from 16550A->16750 and also enables 64-bytes fifo support.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

-- 
 i.

--8323329-472954745-1676044501=:1761--
